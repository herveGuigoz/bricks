import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/domain/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/infrastructure/authentication/in_memory_authentication.dart';

abstract class Dependency {
  static Provider<AuthenticationFacade> get authenticationFacade =>
      _authenticationFacadeProvider;
}

final _authenticationFacadeProvider = Provider<AuthenticationFacade>(
  (ref) => InMemoryAuthenticationRepository(),
);
