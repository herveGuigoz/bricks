import 'package:{{name}}/domain/authentication/models.dart';

abstract class AuthenticationFacade {
  /// Stream which will emit the current user when the authentication state
  /// changes.
  Stream<User?> get user;

  /// Returns the current user.
  Future<User?> get currentUser;

  /// Creates a new user with the provided [email] and [password].
  Future<User> signUp({required String email, required String password});

  /// Starts the Sign In with Google Flow.
  Future<User> logInWithGoogle();

  /// Signs in with the provided [email] and [password].
  Future<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  Future<void> logOut();
}
