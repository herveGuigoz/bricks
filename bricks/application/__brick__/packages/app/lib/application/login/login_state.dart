import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(FormStatus.untouched()) FormStatus status,
    @Default(Email('', untouched: true)) Email email,
    @Default(Password('', untouched: true)) Password password,
  }) = _LoginState;
}
