import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pedro/bootstrap.dart';
import 'package:pedro/modules/app/app.dart';
import 'package:pedro/services/services.dart';

Future<void> main() async {
  await HttpOverrides.runWithHttpOverrides(
    () => bootstrap(() => const ProviderScope(child: App())),
    HandshakeOverride(),
  );
}
