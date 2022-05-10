import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/application/authentication/authentication_controller.dart';
import 'package:{{name}}/application/authentication/authentication_state.dart';
import 'package:{{name}}/infrastructure/providers.dart';

export 'authentication_controller.dart';
export 'authentication_state.dart';

final authStateProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(
    authenticationFacade: ref.read(authenticationFacade),
  ),
);
