part of 'form.dart';

enum FormInputStatus {
  /// The form input has not been touched.
  untouched,

  /// The form input is valid.
  valid,

  /// The form input is not valid.
  invalid,
}

@immutable
abstract class FormInput<T, E> {
  const FormInput(this.value, {this.untouched = false});

  /// The value of the given [FormInput].
  /// For example, if you have a `FormInput` for `FirstName`,
  /// the value could be 'Joe'.
  final T value;

  final bool untouched;

  /// A function that must return a validation error if the provided
  /// [value] is invalid and `null` otherwise.
  E? validator();

  /// Whether the [FormInput] value is valid according to the
  /// overridden `validator`.
  ///
  /// Returns `true` if `validator` returns `null` for the
  /// current [FormInput] value and `false` otherwise.
  bool get valid => validator() == null;

  /// Whether the [FormInput] value is not valid.
  /// A value is invalid when the overridden `validator`
  /// returns an error (non-null value).
  bool get invalid => status == FormInputStatus.invalid;

  FormInputStatus get status {
    return untouched
        ? FormInputStatus.untouched
        : valid
            ? FormInputStatus.valid
            : FormInputStatus.invalid;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormInput<T, E> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$runtimeType(value: $value, status: $status)';
}

/// Email form field with validation.
class Email extends FormInput<String, EmailValidationError> {
  const Email(super.value, {super.untouched = false});

  @override
  EmailValidationError? validator() {
    return EmailValidator.validate(value);
  }
}

/// Password form field with validation.
class Password extends FormInput<String, PasswordValidationError> {
  const Password(super.value, {super.untouched = false});

  @override
  PasswordValidationError? validator() {
    return PasswordValidator.validate(value);
  }
}
