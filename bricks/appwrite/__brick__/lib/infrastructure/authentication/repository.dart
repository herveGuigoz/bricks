import 'package:appwrite/appwrite.dart' hide Storage;
import 'package:appwrite/models.dart' as models;

import 'package:{{name}}/domain/authentication/authentication.dart';

class AuthenticationRepository implements AuthenticationFacade {
  AuthenticationRepository({
    required Client client,
  })  : _account = Account(client),
        _realtime = Realtime(client);

  final Account _account;
  final Realtime _realtime;

  @override
  Stream<User?> get user async* {
    await for (final _ in _realtime.subscribe(['account']).stream) {
      yield await currentUser;
    }
  }

  @override
  Future<User?> get currentUser async {
    try {
      return AccountCodec.userFromAppwrite(await _account.get());
    } on AppwriteException catch (_) {
      return null;
    }
  }

  @override
  Future<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _account.createSession(email: email, password: password);
    return (await currentUser)!;
  }

  @override
  Future<User> logInWithGoogle() {
    // TODO: implement logInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async => _account.deleteSession(sessionId: 'current');

  @override
  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    await _account.create(userId: 'unique()', email: email, password: password);
    return logInWithEmailAndPassword(email: email, password: password);
  }
}

mixin AccountCodec {
  static User userFromAppwrite(models.User user) {
    return User(id: user.$id, email: user.email);
  }
}
