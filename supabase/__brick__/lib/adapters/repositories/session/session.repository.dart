import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:{{name.snakeCase()}}/adapters/repositories/abstract.repository.dart';
import 'package:{{name.snakeCase()}}/adapters/storage/users/user.storage.dart';
import 'package:{{name.snakeCase()}}/domain/entities/entities.dart';
import 'package:{{name.snakeCase()}}/domain/ports/session.dart';

class SessionRepository extends AbstractRepository implements SessionRepositoryInterface {
  SessionRepository();

  final _userStorage = UserStorage();

  final _userController = StreamController<User?>.broadcast();

  @override
  Stream<User?> get currentUser => _userController.stream;

  @override
  Future<void> signInWithPassword(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithOauth(String provider, String redirectTo) async {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithOtp({required String email, required bool isWeb}) async {
    final response = await post(
      '/auth/v1/magiclink',
      queryParameters: {'redirect_to': 'smarthub://email-callback'},
      body: {'email': email, 'create_user': false},
      authorizationRequired: false,
    );

    if (response.hasError) {
      throw SignupError(response);
    }
  }

  /// Get the logged in user.
  Future<User> findMe() async {
    final response = await get('/auth/v1/user');

    if (response.statusCode != 200) {
      throw SignupError(response);
    }

    final user = User.fromJson(response.body as Map<String, dynamic>);
    await _userStorage.write(user);

    return user;
  }

  @override
  User? recoverSession() {
    final user = _userStorage.read();

    return user;
  }

  @override
  Future<User?> handleDeeplink(String path) async {
    final uri = Uri.parse(path.replaceFirst('#', '?'));
    final params = uri.queryParameters;

    if (params case {'access_token': final String refreshToken, 'refresh_token': final String accessToken}) {
      await saveCredentials((accessToken, refreshToken));
      return findMe();
    }

    return null;
  }

  @override
  Future<void> signOut() async {
    try {
      await clearCredentials();
      await _userStorage.delete();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}

class SignupError implements Exception {
  SignupError(this.response);

  final Response response;

  @override
  String toString() => 'Sign up failed with status code ${response.statusCode}';
}
