import 'dart:convert';
import 'dart:io';

import 'package:api_client/src/exceptions/exceptions.dart';
import 'package:api_client/src/requests/context.dart';
import 'package:api_client/src/requests/middleware.dart';
import 'package:api_client/src/responses/response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class HttpClientInterface {
  HttpClientInterface({required String baseURL, Map<String, String>? headers}) {
    _middleware = createInvertedMiddleware(
      (context) => context.copyWith(
        path: Uri.parse(baseURL).resolve(context.path).toString(),
        headers: (headers ?? {}).mergeWith(context.headers),
      ),
    );
  }

  @protected
  final _httpClient = http.Client();

  late Middleware _middleware;

  void addMiddleware(Handler handler) {
    _middleware = createInvertedMiddleware(_middleware.addHandler(handler));
  }

  Future<Response> get(
    String path, {
    Map<String, Object>? queryParameters,
    Map<String, String>? headers,
    bool authorizationRequired = true,
  }) async {
    final context = await _middleware.handler(
      RequestContext(
        method: 'GET',
        path: path,
        authorizationRequired: authorizationRequired,
        headers: headers,
        queryParameters: queryParameters,
      ),
    );

    try {
      final response = await _httpClient.get(
        context.url,
        headers: context.headers,
      );

      return Response(context, response);
    } on SocketException catch (_, stackTrace) {
      Error.throwWithStackTrace(NoInternetConnection(context), stackTrace);
    }
  }

  Future<Response> post(
    String path, {
    required Map<String, dynamic> body,
    Map<String, Object>? queryParameters,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
    bool authorizationRequired = true,
  }) async {
    final context = await _middleware.handler(
      RequestContext(
        method: 'POST',
        path: path,
        authorizationRequired: authorizationRequired,
        headers: headers,
        queryParameters: queryParameters,
        body: body,
      ),
    );

    try {
      final response = await _httpClient.post(
        context.url,
        headers: context.headers,
        body: jsonEncode(context.body),
      );

      return Response(context, response);
    } on SocketException catch (e, stackTrace) {
      Error.throwWithStackTrace(NoInternetConnection(context), stackTrace);
    }
  }

  Future<Response> put(
    String path, {
    required Map<String, dynamic> body,
    Map<String, Object>? queryParameters,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
    bool authorizationRequired = true,
  }) async {
    final context = await _middleware.handler(
      RequestContext(
        method: 'PUT',
        path: path,
        authorizationRequired: authorizationRequired,
        headers: headers,
        queryParameters: queryParameters,
        body: body,
      ),
    );

    try {
      final response = await _httpClient.put(
        context.url,
        headers: context.headers,
        body: jsonEncode(context.body),
      );

      return Response(context, response);
    } on SocketException catch (_, stackTrace) {
      Error.throwWithStackTrace(NoInternetConnection(context), stackTrace);
    }
  }

  Future<Response> patch(
    String path, {
    required Map<String, dynamic> body,
    Map<String, Object>? queryParameters,
    Map<String, String> headers = const {'Content-Type': 'application/json'},
    bool authorizationRequired = true,
  }) async {
    final context = await _middleware.handler(
      RequestContext(
        method: 'PATCH',
        path: path,
        authorizationRequired: authorizationRequired,
        headers: headers,
        queryParameters: queryParameters,
        body: body,
      ),
    );

    try {
      final response = await _httpClient.patch(
        context.url,
        headers: context.headers,
        body: jsonEncode(context.body),
      );

      return Response(context, response);
    } on SocketException catch (_, stackTrace) {
      Error.throwWithStackTrace(NoInternetConnection(context), stackTrace);
    }
  }

  Future<Response> delete(
    String path, {
    Map<String, Object>? queryParameters,
    Map<String, String>? headers,
    bool authorizationRequired = true,
  }) async {
    final context = await _middleware.handler(
      RequestContext(
        method: 'DELETE',
        path: path,
        authorizationRequired: authorizationRequired,
        headers: headers,
        queryParameters: queryParameters,
      ),
    );

    try {
      final response = await _httpClient.delete(
        context.url,
        headers: context.headers,
        body: jsonEncode(context.body),
      );

      return Response(context, response);
    } on SocketException catch (_, stackTrace) {
      Error.throwWithStackTrace(NoInternetConnection(context), stackTrace);
    }
  }
}

extension _MapExtension<K, V> on Map<K, V> {
  /// Returns a [Map] with the values from `this` and the values from [other].
  /// For keys that are the same between `this` and [other], the value in
  /// [other] is used.
  /// If [other] is `null` or empty, `this` is returned unchanged.
  Map<K, V> mergeWith(Map<K, V>? other) {
    if (other == null || other.isEmpty) return this;

    final value = Map.of(this);
    for (final entry in other.entries) {
      final val = entry.value;
      if (val == null) {
        value.remove(entry.key);
      } else {
        value[entry.key] = val;
      }
    }

    return value;
  }
}
