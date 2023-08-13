// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:{{name.snakeCase()}}/domain/di.dart';
import 'package:{{name.snakeCase()}}/domain/ports/session.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/form/form.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/form/inputs/inputs.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginStatePresenter = AutoDisposeNotifierProvider<_LoginFormNotifier, LoginState>(
  _LoginFormNotifier.new,
  name: 'LoginFormNotifierProvider',
);

class _LoginFormNotifier extends AutoDisposeNotifier<LoginState> {
  @protected
  SessionRepositoryInterface get sessionRepository => ref.read(Dependency.sessionRepository);

  @override
  LoginState build() => const LoginState();

  void setEmail(String value) {
    state = state.copyWith(email: Email(value));
  }

  Future<void> submit() async {
    state = state.copyWith(status: const FormStatus.submissionInProgress());
    try {
      await sessionRepository.signInWithOtp(email: state.email.value, isWeb: false);
      state = state.copyWith(status: const FormStatus.submissionSucceed());
    } catch (error) {
      state = state.copyWith(status: FormStatus.submissionFailled(error));
    }
  }
}

@immutable
class LoginState with FormMixin {
  const LoginState({
    this.status = const FormStatus.initial(),
    this.email = const Email.initial(),
  });

  final FormStatus status;

  final Email email;

  @override
  List<FormInput<Object>?> get inputs => [email];

  LoginState copyWith({FormStatus? status, Email? email}) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(covariant LoginState other) {
    if (identical(this, other)) return true;

    return other.status == status && other.email == email;
  }

  @override
  int get hashCode => status.hashCode ^ email.hashCode;
}
