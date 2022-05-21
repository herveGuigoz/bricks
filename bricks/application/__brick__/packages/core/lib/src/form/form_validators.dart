part of 'form.dart';

class EmailValidator {
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  String? call(String? value) => validate(value)?.toString();

  static EmailValidationError? validate(String? value) {
    if (value == null) return RequiredEmailError();
    return _emailRegex.hasMatch(value) ? null : InvalidEmailError();
  }
}

abstract class EmailValidationError {}

class RequiredEmailError implements EmailValidationError {
  @override
  String toString() => 'Email is required';
}

class InvalidEmailError implements EmailValidationError {
  @override
  String toString() => 'Enter a valid email address';
}

class PasswordValidator {
  static final _passwordRegex = RegExp(
    r'^(?=.*[a-z])?(?=.*[A-Z])?(?=.*[0-9])(?=.*[!@#%^&?;\/*])?(?=.{8,})',
  );

  String? call(String? value) => validate(value)?.toString();

  static PasswordValidationError? validate(String? value) {
    return _passwordRegex.hasMatch(value ?? '') ? null : InvalidPasswordError();
  }
}

abstract class PasswordValidationError {}

class InvalidPasswordError implements PasswordValidationError {
  @override
  String toString() => 'Password must be at least 8 characters long';
}
