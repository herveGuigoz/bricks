import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/domain/authentication/authentication.dart';

part 'authentication_state.freezed.dart';
part 'authentication_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.authenticated({
    required User user,
  }) = Authenticated;

  factory AuthState.resolve([User? user]) {
    return user == null ? const Unauthenticated() : Authenticated(user: user);
  }

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
