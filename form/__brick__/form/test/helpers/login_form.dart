import 'package:form/form.dart';

class LoginForm with FormMixin {
  LoginForm({
    this.email = const EmailInput.initial(),
    this.password = const PasswordInput.initial(),
  });

  final EmailInput email;

  final PasswordInput password;

  @override
  List<FormInput<Object>?> get inputs => [email, password];
}
