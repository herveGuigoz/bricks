import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:{{name.snakeCase()}}/adapters/http/http.dart';
import 'package:{{name.snakeCase()}}/adapters/{{name.snakeCase()}}/{{name.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/domain/ports/session.dart';

class SessionRepository extends SupabaseRepository implements SessionRepositoryInterface {
  SessionRepository();

  @override
  Stream<AuthenticationStatus> onAuthenticationStatusEvents() {
    return interceptor.authenticationStatus;
  }

  @override
  Future<void> signInWithOtp({required String email, required bool isWeb}) async {
    final response = await post<void>(
      'https://$PROJECT_ID.{{name.snakeCase()}}.co/auth/v1/otp',
      queryParameters: {'redirect_to': isWeb ? 'http://localhost:3000' : 'io.{{name.snakeCase()}}://otp'},
      body: {
        'email': email,
        'create_user': false,
      },
    );

    if (response.statusCode != 200) {
      throw SignupError(response);
    }
  }

  @override
  AuthenticationStatus recoverSession() {
    final credentials = getCredentials();
    return credentials == null ? AuthenticationStatus.unauthenticated : AuthenticationStatus.authenticated;
  }

  @override
  Future<AuthenticationStatus> handleDeeplink(String path) async {
    final uri = Uri.parse(path.replaceFirst('#', '?'));
    if (!uri.queryParameters.containsKey('access_token')) {
      return AuthenticationStatus.unauthenticated;
    }

    return onReceivedAuthDeeplink(uri);
  }

  Future<AuthenticationStatus> onReceivedAuthDeeplink(Uri uri) async {
    final accessToken = uri.queryParameters['access_token'];
    final refreshToken = uri.queryParameters['refresh_token'];

    if (accessToken == null || refreshToken == null) {
      return AuthenticationStatus.unauthenticated;
    }

    try {
      final credentials = Credentials(accessToken: accessToken, refreshToken: refreshToken);
      await saveCredentials(credentials);
      return AuthenticationStatus.authenticated;
    } catch (error) {
      return AuthenticationStatus.unauthenticated;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await clearCredentials();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Credentials? getCredentials() => interceptor.getCredentials();

  @protected
  Future<void> saveCredentials(Credentials value) => interceptor.saveCredentials(value);

  @protected
  Future<void> clearCredentials() => interceptor.clearCredentials();
}

class SignupError<T> implements Exception {
  SignupError(this.response);

  final Response<T> response;

  @override
  String toString() => 'Sign up failed with status code ${response.statusCode}';
}
