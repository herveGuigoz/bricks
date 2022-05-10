import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/infrastructure/authentication/repository.dart';

final appwriteClientProvider = Provider(
  (ref) => Client(
    endPoint: const String.fromEnvironment('SERVER_NAME'),
    selfSigned: true, // only use for development
  ).setProject(const String.fromEnvironment('PROJECT_ID')),
);

final authenticationFacade = Provider(
  (ref) => AuthenticationRepository(client: ref.read(appwriteClientProvider)),
);
