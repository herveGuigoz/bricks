import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication_controller.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication_state.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/domain/providers.dart';

export 'authentication_controller.dart';
export 'authentication_state.dart';

final authStateProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(
    authenticationFacade: ref.read(Dependency.authenticationFacade),
  ),
);
