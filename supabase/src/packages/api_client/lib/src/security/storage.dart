import 'dart:async';

import 'package:api_client/src/security/credentials.dart';

abstract class CredentialsStorageInterface {
  const CredentialsStorageInterface();

  FutureOr<Credentials?> read();

  FutureOr<void> write(Credentials credentials);

  FutureOr<void> delete();
}
