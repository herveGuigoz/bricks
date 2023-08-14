enum AuthenticationStatus { authenticated, unauthenticated }

abstract class SessionRepositoryInterface {
  /// Method to notify when authentication status changed.
  Stream<AuthenticationStatus> onAuthenticationStatusEvents();

  /// Methods to do sign in.
  Future<void> signInWithPassword(String email, String password);

  Future<void> signInWithOauth(String provider, String redirectTo);

  Future<void> signInWithOtp({required String email, required bool isWeb});

  /// Recover session from deep links.
  Future<AuthenticationStatus?> handleDeeplink(String path);

  /// Recover/refresh session if it's available.
  AuthenticationStatus recoverSession();

  /// Method to do sign out.
  Future<void> signOut();
}

class SignInException implements Exception {
  @override
  String toString() => 'An error occurred while signing in.';
}
