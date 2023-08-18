import 'package:api_client/src/requests/context.dart';

class NoInternetConnection implements Exception {
  NoInternetConnection(this.context);

  final RequestContext context;

  @override
  String toString() => 'Pas de connexion internet';
}

class RefreshTokenException implements Exception {
  RefreshTokenException(this.error);

  final String error;

  @override
  String toString() => 'RefreshTokenException: $error';
}
