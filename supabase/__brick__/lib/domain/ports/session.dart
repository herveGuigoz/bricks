import 'package:{{name.snakeCase()}}/domain/entities/entities.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

abstract class SessionRepositoryInterface {
  /// Method to notify when user changed.
  Stream<User?> get currentUser;

  /// Methods to do sign in.
  Future<void> signInWithPassword(String email, String password);

  Future<void> signInWithOauth(String provider, String redirectTo);

  Future<void> signInWithOtp({required String email, required bool isWeb});

  /// Recover session from deep links.
  Future<User?> handleDeeplink(String path);

  /// Recover/refresh session if it's available.
  User? recoverSession();

  /// Method to do sign out.
  Future<void> signOut();
}

abstract class SessionException implements Exception {
  @override
  String toString() => '$runtimeType';
}

class SignInException implements SessionException {}
