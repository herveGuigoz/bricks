import 'dart:async';

import 'package:logger/logger.dart';

typedef Data = Map<String, Object?>;
final _token = Object();
const _asyncRunZoned = runZoned;

/// Set up error handling for the app.
///
/// Can be call anywhere with:
/// ```dart
/// ErrorsHandler.current?.report(error);
/// ```
abstract class ErrorsScope {
  static ErrorsScope? get current => Zone.current[_token] as ErrorsScope?;

  static Future<R> runZoned<R>(R Function() body) async {
    final scope = ErrorsHandler();
    return _asyncRunZoned<R>(
      body,
      zoneValues: {_token: await scope.init()},
      onError: scope.report,
    );
  }

  Future<void> report(Object error, {StackTrace? stack, Data? data});
}

class ErrorsHandler extends ErrorsScope {
  Future<ErrorsScope> init() async {
    return this;
  }

  @override
  Future<void> report(Object error, {StackTrace? stack, Data? data}) async {
    Logger().e({'error': '$error', 'data': data}, error, stack);
  }
}
