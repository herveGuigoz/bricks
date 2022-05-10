import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/application/authentication/authentication.dart';
import 'package:{{name}}/application/login/login_controller.dart';
import 'package:{{name}}/application/login/login_state.dart';

export 'login_controller.dart';
export 'login_state.dart';

final loginStateProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) {
    return LoginController(
      authController: ref.read(authStateProvider.notifier),
    );
  },
);
