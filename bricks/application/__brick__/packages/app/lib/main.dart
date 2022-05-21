import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_notifier/hydrated_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/app/app.dart';

void main() {
  bootstrap(() async {
    HydratedStateNotifier.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    );
    // await HydratedStateNotifier.storage.clear();
    return const ProviderScope(child: App());
  });
}
