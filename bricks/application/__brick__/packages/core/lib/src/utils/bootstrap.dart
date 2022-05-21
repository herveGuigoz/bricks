import 'dart:async';

import 'package:core/src/utils/errors.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    ErrorsScope.current?.report(details.exception, stack: details.stack);
  };

  return ErrorsScope.runZoned(
    () async => runApp(await builder()),
  );
}
