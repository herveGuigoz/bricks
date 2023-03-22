import 'package:form/form.dart';
import 'package:test/test.dart';

void main() {
  group('EmailInput', () {
    test('is pure when initial constructor is used', () {
      final input = EmailInput.initial();
      expect(input.isPure, isTrue);
    });

    test('is not pure when default constructor is used', () {
      final input = EmailInput('');
      expect(input.isPure, isFalse);
    });

    test('is not pure when copyWith is used', () {
      EmailInput input = EmailInput.initial();
      expect(input.isPure, isTrue);
      input = input.copyWith(value: 'foo');
      expect(input.isPure, isFalse);
    });

    test('is valid when containing a valid value', () {
      final input = EmailInput('foo@example.com');
      expect(input.isValid, isTrue);
    });

    test('is not valid when containing invalid value', () {
      final input = EmailInput('foo@example.com bar');
      expect(input.isValid, isFalse);
    });
  });

  group('PasswordInput', () {
    test('is pure when initial constructor is used', () {
      final input = PasswordInput.initial();
      expect(input.isPure, isTrue);
    });

    test('is not pure when default constructor is used', () {
      final input = PasswordInput('foo');
      expect(input.isPure, isFalse);
    });

    test('is not pure when copyWith is used', () {
      PasswordInput input = PasswordInput.initial();
      expect(input.isPure, isTrue);
      input = input.copyWith(value: 'foo');
      expect(input.isPure, isFalse);
    });

    test('is valid when containing a valid value', () {
      final input = PasswordInput('Exemple123');
      expect(input.isValid, isTrue);
    });

    test('is not valid when containing invalid value', () {
      final input = PasswordInput('foo-bar');
      expect(input.isValid, isFalse);
    });
  });
}
