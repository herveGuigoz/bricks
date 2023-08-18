import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:app_name/adapters/storage/storage.dart';

class CredentialsStorage implements CredentialsStorageInterface {
  CredentialsStorage() : _storage = Storage.instance;

  final Storage _storage;

  static const String _kStorageKey = '_credentials_';

  @override
  Credentials? read() {
    final json = _storage.read(_kStorageKey);

    if (json == null) {
      return null;
    }

    final credentials = jsonDecode(json) as Map<String, dynamic>;

    if (credentials case {'access_token': final String refreshToken, 'refresh_token': final String accessToken}) {
      return (refreshToken, accessToken);
    }

    throw Exception('Invalid credentials from storage: $credentials');
  }

  @override
  Future<void> write(Credentials credentials) async {
    final (accessToken, refreshToken) = credentials;

    final json = jsonEncode({'access_token': accessToken, 'refresh_token': refreshToken});

    await _storage.write(_kStorageKey, json);
  }

  @override
  Future<void> delete() async {
    await _storage.delete(_kStorageKey);
  }
}
