import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/login/login_state.dart';

class LoginController extends StateNotifier<LoginState> with FormMixin {
  LoginController({
    required AuthController authController,
  })  : _authController = authController,
        super(const LoginState());

  final AuthController _authController;

  /// Takes a string value and sets the email property to that value.
  void emailChanged(String value) {
    final email = Email(value);
    state = state.copyWith(
      email: email,
      status: validate([email, state.password]),
    );
  }

  /// Takes a string value and sets the password variable to that value.
  void passwordChanged(String value) {
    final password = Password(value);
    state = state.copyWith(
      password: password,
      status: validate([state.email, password]),
    );
  }

  /// A function that is called when the user clicks the submit button.
  Future<void> submit() async {
    if (state.status.isValid) {
      state = state.copyWith(status: const FormStatus.submissionInProgress());

      final result = await Result.guard(() async {
        return _authController.logIn(
          email: state.email.value,
          password: state.password.value,
        );
      });
      
      result.onError(
        (failure) => state = state.copyWith(
          status: FormStatus.submissionFailure(failure.error),
        ),
      );
    }
  }
}
