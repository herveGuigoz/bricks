import 'package:form/form.dart';
import 'package:test/test.dart';

void main() {
  group('EmailInput', () {
    test('is pure when initial constructor is used', () {
      const input = EmailInput();
      expect(input.isPure, isTrue);
    });

    test('is not pure when copyWith is used', () {
      const input = EmailInput();
      expect(input.copyWith('foo').isPure, isFalse);
    });

    test('is valid when containing a valid value', () {
      const input = EmailInput(value: 'foo@example.com');
      expect(input.isValid, isTrue);
    });

    test('is not valid when containing invalid value', () {
      const input = EmailInput(value: 'foo@example.com bar');
      expect(input.isValid, isFalse);
    });
  });

  group('PasswordInput', () {
    test('is pure when default constructor is used', () {
      const input = PasswordInput(value: 'foo');
      expect(input.isPure, isTrue);
    });

    test('is not pure when copyWith is used', () {
      const input = PasswordInput();
      expect(input.copyWith('foo').isPure, isFalse);
    });

    test('is valid when containing a valid value', () {
      const input = PasswordInput(value: 'Exemple123');
      expect(input.isValid, isTrue);
    });

    test('is not valid when containing invalid value', () {
      const input = PasswordInput(value: 'foo-bar');
      expect(input.isValid, isFalse);
    });
  });
}
