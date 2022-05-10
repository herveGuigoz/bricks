import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{name}}/domain/authentication/authentication.dart';

part 'authentication_state.freezed.dart';
part 'authentication_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = Unauthenticated;

  const factory AuthState.authenticated({
    required User user,
  }) = Authenticated;

  // factory AuthState.resolve([Session? session]) {
  //   return session == null
  //       ? const Unauthenticated()
  //       : Authenticated(session: session);
  // }

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
