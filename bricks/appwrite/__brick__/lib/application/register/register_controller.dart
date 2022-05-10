import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:{{name}}/application/authentication/authentication.dart';
import 'package:{{name}}/application/register/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController({
    required AuthController authController,
  })  : _authController = authController,
        super(const RegisterState());

  final AuthController _authController;

  @override
  set state(RegisterState value) {
    super.state = value.copyWith(
      status: Formz.validate([value.email, value.password, value.terms]),
    );
  }

  /// It takes a string value and sets the email property to that value.
  ///
  /// Args:
  ///   value (String): The value of the input field.
  void emailChanged(String value) {
    state = state.copyWith(email: Email.dirty(value));
  }

  /// It takes a string value and sets the password variable to that value.
  ///
  /// Args:
  ///   value (String): The value of the input field.
  void passwordChanged(String value) {
    state = state.copyWith(password: Password.dirty(value));
  }

  /// A function that's called when the terms have changed
  void termsChanged() {
    state = state.copyWith(terms: Terms(value: !state.terms.value));
  }

  /// A function that is called when the user clicks the submit button.
  Future<void> submit() async {
    if (state.status.isValidated) {
      try {
        state = state.copyWith(status: FormzStatus.submissionInProgress);

        await _authController.register(
          email: state.email.value,
          password: state.password.value,
        );
      } catch (_) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
