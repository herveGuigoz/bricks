import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:{{name}}/application/authentication/authentication.dart';
import 'package:{{name}}/application/login/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController({
    required AuthController authController,
  })  : _authController = authController,
        super(const LoginState());

  final AuthController _authController;

  @override
  set state(LoginState value) {
    super.state = value.copyWith(
      status: Formz.validate([value.email, value.password]),
    );
  }

  /// Takes a string value and sets the email property to that value.
  void emailChanged(String value) {
    state = state.copyWith(email: Email.dirty(value));
  }

  /// Takes a string value and sets the password variable to that value.
  void passwordChanged(String value) {
    state = state.copyWith(password: Password.dirty(value));
  }

  /// A function that is called when the user clicks the submit button.
  Future<void> submit() async {
    if (state.status.isValidated) {
      try {
        state = state.copyWith(status: FormzStatus.submissionInProgress);

        await _authController.logIn(
          email: state.email.value,
          password: state.password.value,
        );
      } catch (_) {
        state = state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
