import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/register/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> with FormMixin {
  RegisterController({
    required AuthController authController,
  })  : _authController = authController,
        super(const RegisterState());

  final AuthController _authController;

  /// It takes a string value and sets the email property to that value.
  ///
  /// Args:
  ///   value (String): The value of the input field.
  void emailChanged(String value) {
    final email = Email(value);
    state = state.copyWith(
      email: email,
      status: validate([email, state.password, state.terms]),
    );
  }

  /// It takes a string value and sets the password variable to that value.
  ///
  /// Args:
  ///   value (String): The value of the input field.
  void passwordChanged(String value) {
    final password = Password(value);
    state = state.copyWith(
      password: password,
      status: validate([state.email, password, state.terms]),
    );
  }

  /// A function that's called when the terms have changed
  void termsChanged() {
    state = state.copyWith(terms: Terms(value: !state.terms.value));
  }

  /// A function that is called when the user clicks the submit button.
  Future<void> submit() async {
    if (state.status.isValid) {
      state = state.copyWith(status: const FormStatus.submissionInProgress());

      final result = await Result.guard(() async {
        return _authController.register(
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
