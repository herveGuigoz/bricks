import 'package:app_name/presentation/shared/form/form.dart';

class Email extends FormInput<String> {
  const Email(super.value);
  const Email.initial() : super.initial('');

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  String? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : 'Inavlid email adress';
  }
}
