import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/application/authentication/authentication.dart';
import 'package:{{name}}/application/register/register_controller.dart';
import 'package:{{name}}/application/register/register_state.dart';

export 'register_controller.dart';
export 'register_state.dart';

final registerStateProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>(
  (ref) {
    return RegisterController(
      authController: ref.read(authStateProvider.notifier),
    );
  },
);
