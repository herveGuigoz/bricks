import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/domain/authentication/authentication.dart';

class InMemoryAuthenticationRepository implements AuthenticationFacade {
  User? _currentUser;

  @override
  Stream<User?> get user async* {}

  @override
  Future<User?> get currentUser async => _currentUser;

  @override
  Future<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
    );
  }

  @override
  Future<User> logInWithGoogle() async {
    return _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: 'google_login@mail.com',
    );
  }

  @override
  Future<void> logOut() async {
    _currentUser = null;
  }

  @override
  Future<User> signUp({required String email, required String password}) async {
    return _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
    );
  }
}
