import 'dart:async';

import 'package:hydrated_notifier/hydrated_notifier.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication_state.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/domain/authentication/authentication.dart';

class AuthController extends HydratedStateNotifier<AuthState> {
  AuthController({
    AuthState initialState = const AuthState.unauthenticated(),
    required AuthenticationFacade authenticationFacade,
  })  : _authInterface = authenticationFacade,
        super(initialState) {
    _userSubscription = authenticationFacade.user.listen((event) {
      state = AuthState.resolve(event);
    });
  }

  final AuthenticationFacade _authInterface;
  late final StreamSubscription<User?> _userSubscription;

  /// Starts the Sign In with Google Flow.
  Future<void> logInWithGoogle() => _authInterface.logInWithGoogle();

  Future<void> register({
    required String email,
    required String password,
  }) async {
    final user = await _authInterface.signUp(email: email, password: password);
    state = AuthState.authenticated(user: user);
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    final user = await _authInterface.logInWithEmailAndPassword(
      email: email,
      password: password,
    );
    state = AuthState.authenticated(user: user);
  }

  /// It logs out the user.
  Future<void> logOut() async {
    state = const AuthState.unauthenticated();
    return _authInterface.logOut();
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) => AuthState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
}
