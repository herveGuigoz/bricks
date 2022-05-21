import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(FormStatus.untouched()) FormStatus status,
    @Default(Email('', untouched: true)) Email email,
    @Default(Password('', untouched: true)) Password password,
    @Default(Terms()) Terms terms,
  }) = _RegisterState;
}

class Terms extends FormInput<bool, String> {
  const Terms({bool value = true, super.untouched = false}) : super(value);

  @override
  String? validator() {
    return value ? null : 'You must accept the terms to continue';
  }
}
