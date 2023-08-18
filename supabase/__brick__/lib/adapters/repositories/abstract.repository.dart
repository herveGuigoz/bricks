// ignore_for_file: constant_identifier_names

import 'package:api_client/api_client.dart';
import 'package:{{name.snakeCase()}}/adapters/storage/credentials/credentials.storage.dart';

const PROJECT_ID = String.fromEnvironment('PROJECT_ID');

const API_KEY = String.fromEnvironment('SUPABASE_KEY');

typedef Json = Map<String, dynamic>;

class AbstractRepository extends HttpClientInterface with JwtAuthenticationMixin {
  AbstractRepository()
      : storage = CredentialsStorage(),
        super(baseURL: baseURL, headers: {'apikey': API_KEY, 'Content-Type': 'application/json'}) {
    addMiddleware(addAuthorizationHeader);
  }

  static const baseURL = 'https://$PROJECT_ID.supabase.co';

  @override
  final CredentialsStorage storage;

  @override
  Future<Credentials?> refreshToken(String token) async {
    final response = await post('/auth/v1/token', body: {'refresh_token': token}, authorizationRequired: false);

    if (response.hasError) {
      return null;
    }

    final json = response.body as Map<String, dynamic>;

    if (json case {'access_token': final String refreshToken, 'refresh_token': final String accessToken}) {
      return (refreshToken, accessToken);
    }

    return null;
  }
}
