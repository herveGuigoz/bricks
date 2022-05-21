import 'dart:convert';

import 'package:core/src/http/http_models.dart';
import 'package:core/src/http/http_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fresh_dio/fresh_dio.dart';

typedef Json = Map<String, dynamic>;

abstract class ApiClientInterface {
  /// Sends an HTTP GET request for the given uri.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  /// Sends an HTTP POST request for the given uri.
  Future<Response<T>> post<T>(
    String path, {
    required Map<String, Object> body,
    Map<String, dynamic>? queryParameters,
  });

  /// Sends an HTTP PUT request for the given uri.
  Future<Response<T>> put<T>(
    String path, {
    required Map<String, Object> body,
    Map<String, dynamic>? queryParameters,
  });

  /// Sends an HTTP DELETE request for the given uri.
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, Object>? body,
    Map<String, dynamic>? queryParameters,
  });

  /// Sends an HTTP POST request for uploading files.
  Future<T> upload<T>(
    String path, {
    required String filePath,
    String? fileName,
  });
}

class ApiClient extends DioClient with AuthorizationMixin {
  ApiClient({
    required String baseURL,
    required this.refreshTokenURL,
  }) : super(baseURL: baseURL) {
    httpClient.interceptors.addAll([_fresh, LogInterceptor()]);
  }

  @override
  @protected
  final String refreshTokenURL;
}

abstract class DioClient implements ApiClientInterface {
  DioClient({
    required String baseURL,
  }) : httpClient = Dio()
          ..options.baseUrl = baseURL
          ..options.headers = Header.merge(
            const [JsonContentType(), AcceptJson()],
          );

  @protected
  final Dio httpClient;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return httpClient.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    required Map<String, Object> body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return httpClient.post<T>(
      path,
      data: jsonEncode(body),
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    required Map<String, Object> body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return httpClient.put<T>(
      path,
      data: jsonEncode(body),
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, Object>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return httpClient.delete<T>(
      path,
      data: body,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<T> upload<T>(
    String path, {
    required String filePath,
    String? fileName,
  }) async {
    final file = <String, dynamic>{
      'file': await MultipartFile.fromFile(filePath, filename: fileName),
    };

    final response = await httpClient.post<String>(
      path,
      data: FormData.fromMap(file),
    );

    return jsonDecode(response.data!) as T;
  }
}

mixin AuthorizationMixin on DioClient {
  late final _refreshTokenClient = RefreshTokenClient(refreshTokenURL);

  late final _fresh = Fresh<Credentials>(
    refreshToken: _refreshTokenClient,
    tokenHeader: _refreshTokenClient.tokenHeader,
    shouldRefresh: _refreshTokenClient.shouldRefresh,
    tokenStorage: const ApiClientStorage(),
  );

  String get refreshTokenURL;

  Stream<AuthenticationStatus> get authenticationStatus {
    return _fresh.authenticationStatus;
  }

  Future<void> setCredentials(Credentials? credentials) {
    if (credentials == null) {
      return _fresh.clearToken();
    }
    return _fresh.setToken(credentials);
  }

  Future<Credentials?> getCredentials() async {
    return _fresh.token;
  }
}

/// Exception thrown if there was no [ApiClient] instancied.
class ApiClientNotFound implements Exception {
  const ApiClientNotFound();

  @override
  String toString() {
    return 'ApiClient was accessed before it was initialized.\n'
        'Please ensure that client has been initialized.\n\n'
        'For example:\n\n'
        "ApiClient.instance = ApiClient(baseURL: '..', refreshTokenURL: '..');";
  }
}

class RefreshTokenClient {
  const RefreshTokenClient(this.refreshTokenURL);

  final String refreshTokenURL;

  Map<String, String> tokenHeader(Credentials credentials) {
    return Bearer(credentials.token).toMap();
  }

  bool shouldRefresh([Response? response]) {
    return response?.statusCode == 401 &&
        response?.requestOptions.path != refreshTokenURL;
  }

  Future<Credentials> call(
    Credentials? credentials,
    Dio dio,
  ) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        refreshTokenURL,
        data: jsonEncode({'refresh_token': credentials!.refreshToken}),
      );

      return Credentials.fromJson(response.data!);
    } catch (_) {
      throw RevokeTokenException();
    }
  }
}
