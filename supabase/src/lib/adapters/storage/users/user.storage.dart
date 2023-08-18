import 'dart:convert';

import 'package:app_name/adapters/storage/storage.dart';
import 'package:app_name/domain/entities/entities.dart';

class UserStorage {
  UserStorage() : _storage = Storage.instance;

  final Storage _storage;

  static const String _kStorageKey = '_user_';

  User? read() {
    final json = _storage.read(_kStorageKey);

    if (json == null) {
      return null;
    }

    return User.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> write(User user) async {
    await _storage.write(_kStorageKey, jsonEncode(user.toJson()));
  }

  Future<void> delete() async {
    await _storage.delete(_kStorageKey);
  }
}
