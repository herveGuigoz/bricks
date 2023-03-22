import 'package:form/form.dart';
import 'package:test/test.dart';

import 'helpers/login_form.dart';

void main() {
  group('FormMixin', () {
    test('is pure when none of the inputs were touched', () {
      final form = LoginForm();
      expect(form.isPure, isTrue);
    });

    test('is dirty when one or multiple inputs were touched', () {
      final form = LoginForm(email: const EmailInput('foo@domain.com'));
      expect(form.isPure, isFalse);
    });

    test('is valid when all fields are valid', () {
      final form = LoginForm(
        email: const EmailInput('foo@domain.com'),
        password: const PasswordInput('Exemple123'),
      );
      expect(form.isValid, isTrue);
    });

    test('is invalid when one or multiple inputs were invalid', () {
      final form = LoginForm(
        email: const EmailInput('foo@domain.com'),
        password: const PasswordInput('foo'),
      );
      expect(form.isValid, isFalse);
    });
  });
}
