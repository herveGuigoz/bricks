import 'package:form/form.dart';

class LoginForm with FormMixin {
  const LoginForm({
    this.email = const EmailInput(),
    this.password = const PasswordInput(),
  });

  final EmailInput email;

  final PasswordInput password;

  @override
  List<FormInput<Object>?> get inputs => [email, password];
}
