part of 'navigation.dart';

/// The signature of the widget builder callback for a matched route.
typedef PageBuilder = Widget Function(
  BuildContext context,
  TheRouterState state,
);

/// The signature of redirection
typedef Redirect = String? Function();

@freezed
class TheRoute with _$TheRoute implements Comparable<TheRoute> {
  const factory TheRoute({
    // The current path location without query parameters. (/authors/:id)
    required String path,
    // The redirection for this route
    Redirect? redirect,
    // The page builder for this route.
    PageBuilder? builder,
    // The error associated with the current route.
    Exception? error,
  }) = _TheRoute;

  const TheRoute._();

  // A unique string key for the current route.
  ValueKey<String> get key => ValueKey(error != null ? 'error' : path);

  @override
  int compareTo(TheRoute other) {
    return path.length.compareTo(other.path.length);
  }
}
