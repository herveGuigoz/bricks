part of '../form.dart';

const _invalidEmailMessage = 'This value is not a valid email address.';

const _invalidPasswordMessage = 'Password must be at least 8 characters long and contain at least one letter and one number.';

class EmailInput extends FormInput<String> with EmailValidator {
  const EmailInput(String value, {this.message = _invalidEmailMessage}) : super(value, isPure: false);

  const EmailInput.initial({String value = '', this.message = _invalidEmailMessage}) : super(value, isPure: true);

  @override
  final String message;

  EmailInput copyWith({String? value}) {
    return EmailInput(value ?? this.value, message: message);
  }
}

class PasswordInput extends FormInput<String> with RegexValidator {
  const PasswordInput(String value, {this.message = _invalidPasswordMessage}) : super(value, isPure: false);

  const PasswordInput.initial({String value = '', this.message = _invalidPasswordMessage}) : super(value, isPure: true);

  /// ^ - matches the start of the string.
  /// (?=.*[A-Za-z]) - positive lookahead to ensure that there is at least one letter in the string.
  /// (?=.*\d) - positive lookahead to ensure that there is at least one number in the string.
  /// [\S]{8,} - matches any combination of letters and numbers that is at least 8 characters long.
  /// $ - matches the end of the string.
  @override
  String get pattern => r'^(?=.*[A-Za-z])(?=.*\d)[\S]{8,}$';

  @override
  final String message;

  PasswordInput copyWith({String? value}) {
    return PasswordInput(value ?? this.value, message: message);
  }
}
