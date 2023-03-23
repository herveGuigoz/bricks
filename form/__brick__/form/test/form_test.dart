import 'package:form/form.dart';
import 'package:test/test.dart';

import 'helpers/login_form.dart';

void main() {
  group('FormMixin', () {
    test('is pure when none of the inputs were touched', () {
      const form = LoginForm();
      expect(form.isPure, isTrue);
    });

    test('is dirty when one or multiple inputs were touched', () {
      const email = EmailInput();
      final form = LoginForm(email: email.copyWith('foo@domain.com'));
      expect(form.isPure, isFalse);
    });

    test('is valid when all fields are valid', () {
      const form = LoginForm(
        email: EmailInput(value: 'foo@domain.com'),
        password: PasswordInput(value: 'Exemple123'),
      );
      expect(form.isValid, isTrue);
    });

    test('is invalid when one or multiple inputs were invalid', () {
      const form = LoginForm(
        email: EmailInput(value: 'foo@domain.com'),
        password: PasswordInput(value: 'foo'),
      );
      expect(form.isValid, isFalse);
    });
  });
}
