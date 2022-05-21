import 'dart:convert';

import 'package:core/src/http/http_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';

class ApiClientStorage implements TokenStorage<Credentials> {
  const ApiClientStorage({
    this.storage = const FlutterSecureStorage(),
  });

  static const String _kStorageKey = '_credentials_';

  @protected
  final FlutterSecureStorage storage;

  @override
  Future<Credentials?> read() async {
    final credentials = await storage.read(key: _kStorageKey);

    return (credentials?.isNotEmpty ?? false)
        ? Credentials.fromJson(jsonDecode(credentials!) as Map<String, dynamic>)
        : null;
  }

  @override
  Future<void> write(Credentials credentials) async {
    await storage.write(
      key: _kStorageKey,
      value: jsonEncode(credentials.toJson()),
    );
  }

  @override
  Future<void> delete() {
    return storage.delete(key: _kStorageKey);
  }
}
