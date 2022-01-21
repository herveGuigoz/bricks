import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/bootstrap.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/app/app.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/services/services.dart';

Future<void> main() async {
  await HttpOverrides.runWithHttpOverrides(
    () => bootstrap(() => const ProviderScope(child: App())),
    HandshakeOverride(),
  );
}
