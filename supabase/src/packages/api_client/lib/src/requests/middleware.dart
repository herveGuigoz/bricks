import 'dart:async';

import 'package:api_client/src/requests/context.dart';

/// Series of layers through which a request passes before reaching its final destination.
typedef Middleware = Handler Function(Handler innerHandler);

/// A Handler is a function that takes a RequestContext (e.g., an HTTP request) and returns either a RequestContext
/// directly or a Future of RequestContext.
typedef Handler = FutureOr<RequestContext> Function(RequestContext request);

// Factory function to create a Middleware with the original behavior.
// First, the innerHandler processes the request, then the handler processes the result.
Middleware createMiddleware(Handler handler) {
  return (Handler innerHandler) {
    return (request) {
      return Future.sync(() => innerHandler(request)).then(
        (result) async => handler(result),
      );
    };
  };
}

// Factory function to create a Middleware with the inverted behavior.
// First, the handler processes the request, then the innerHandler processes the result.
Middleware createInvertedMiddleware(Handler handler) {
  return (Handler innerHandler) {
    return (request) {
      return Future.sync(() => handler(request)).then(
        (result) async => innerHandler(result),
      );
    };
  };
}

extension MiddlewareExtension on Middleware {
  /// Merges the current middleware with a given handler to produce a new Handler.
  /// This is useful when you want to chain multiple middleware functions together.
  Handler addHandler(Handler handler) => this(handler);

  // A simple getter that returns a Handler from the current middleware.
  // Essentially, this just passes the RequestContext through without additional processing.
  Handler get handler => addHandler((context) => context);
}
