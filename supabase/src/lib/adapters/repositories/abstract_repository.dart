// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:app/adapters/http/http.dart';
import 'package:app/adapters/storage/storage.dart';

const PROJECT_ID = String.fromEnvironment(
  'PROJECT_ID',
);

const API_KEY = String.fromEnvironment(
  'SUPABASE_KEY',
);

typedef Json = Map<String, dynamic>;

abstract class SupabaseRepository extends HttpClientInterface {
  SupabaseRepository() : super(headers: {'apikey': API_KEY, 'Content-Type': 'application/json'}) {
    interceptor = SupabaseJwtInterceptor(storage: CredentialsStorage());
    client.interceptors.add(interceptor);
  }

  @protected
  late final JwtInterceptor interceptor;
}

class SupabaseJwtInterceptor extends JwtInterceptor {
  SupabaseJwtInterceptor({required super.storage});

  @override
  Future<Credentials> refreshToken(Credentials credentials) async {
    final response = await httpClient.post<Json>(
      '$PROJECT_ID/auth/v1/token',
      queryParameters: {
        'grant_type': 'refresh_token',
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${credentials.accessToken}',
          'apikey': API_KEY,
        },
      ),
      data: {'refresh_token': credentials.refreshToken},
    );

    return Credentials.fromJson(response.data!);
  }
}

class CredentialsStorage implements CredentialsStorageInterface {
  CredentialsStorage() : _storage = Storage.instance;

  final Storage _storage;

  static const String _kStorageKey = '_credentials_';

  @override
  Credentials? read() {
    final json = _storage.read(_kStorageKey);
    if (json != null) {
      return Credentials.fromJson(jsonDecode(json) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> write(Credentials credentials) async {
    await _storage.write(_kStorageKey, jsonEncode(credentials.toJson()));
  }

  @override
  Future<void> delete() async {
    await _storage.delete(_kStorageKey);
  }
}
