import 'dart:async';

import 'package:api_client/src/exceptions/exceptions.dart';
import 'package:api_client/src/requests/context.dart';
import 'package:api_client/src/security/credentials.dart';
import 'package:api_client/src/security/jwt_decoder.dart';
import 'package:api_client/src/security/storage.dart';
import 'package:meta/meta.dart';

import 'package:rxdart/rxdart.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

mixin JwtAuthenticationMixin {
  /// Local storage to save user's [Credentials].
  /// As this is sensitive data, it should be encrypted.
  CredentialsStorageInterface get storage;

  /// The current [AuthenticationStatus].
  static final _authStatusController = BehaviorSubject<AuthenticationStatus>();

  /// Observable for the current [AuthenticationStatus].
  Stream<AuthenticationStatus> get authenticationStatus {
    return _authStatusController.stream;
  }

  /// Called when the token is expired and need to be refreshed.
  /// Param [token] is the refresh token from the current [Credentials].
  Future<Credentials?> refreshToken(String token);

  /// Add jwt token to request header if user is authenticated and take care of
  /// the refresh feature if the token is expired.
  Future<RequestContext> addAuthorizationHeader(RequestContext context) async {
    if (!context.authorizationRequired) {
      return context;
    }

    final credentials = await getCredentials();

    if (credentials case (String accessToken, final String refreshToken)) {
      final isExpired = JwtDecoder.isExpired(accessToken);

      if (isExpired) {
        accessToken = await requestNewAccessToken(refreshToken);
      }

      return context.addHeader('Authorization', 'Bearer $accessToken');
    }

    return context;
  }

  /// Get the current [Credentials].
  FutureOr<Credentials?> getCredentials() {
    return Future.sync(storage.read);
  }

  /// Save the provided [Credentials].
  Future<void> saveCredentials(Credentials value) async {
    await Future.sync(() => storage.write(value));
    _authStatusController.add(AuthenticationStatus.authenticated);
  }

  /// Clears [Credentials].
  Future<void> clearCredentials() async {
    await Future.sync(storage.delete);
    _authStatusController.add(AuthenticationStatus.unauthenticated);
  }

  /// Request new tokens using the provided access token.
  ///
  /// If the request fails, [RefreshTokenException] is thrown.
  /// If the request succeeds, the new [Credentials] are saved and the new
  /// access token is returned.
  @internal
  Future<String> requestNewAccessToken(String token) async {
    final credentials = await refreshToken(token);

    if (credentials case (final String accessToken, final String refreshToken)) {
      await saveCredentials((accessToken, refreshToken));

      return accessToken;
    }

    await clearCredentials();

    throw RefreshTokenException('Failed to refresh token');
  }
}
