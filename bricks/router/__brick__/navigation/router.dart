part of 'navigation.dart';

/// Manage the [TheRouterState] and notify listeners on changes.
abstract class TheRouter extends ChangeNotifier with TheRouterStateMixin {
  TheRouter(
    this._templates, [
    this.refreshListenable,
  ]) {
    // Assert that all templates are valid.
    for (final template in _templates) {
      if (template.builder == null && template.redirect == null) {
        throw Exception(
          'Invalid path (${template.path}): '
          'both page builder and redirection are null',
        );
      }
    }

    // Use paths for web instead of a leading hash (#).
    if (kIsWeb) {
      setPathUrlStrategy();
    }

    // When the listener changes, refresh the route.
    refreshListenable?.addListener(refresh);
  }

  /// Find the current [TheRouter] in the widget tree.
  static TheRouter of(BuildContext context) {
    final res = context.dependOnInheritedWidgetOfExactType<InheritedRouter>();
    assert(res != null, 'No TheRouter found in context');
    return res!.theRouter;
  }

  /// List of top level routes used by the router delegate.
  final List<TheRoute> _templates;

  /// The current route state.
  late TheRouterState _state;

  /// Listenable used to cause the router to refresh it's route.
  final Listenable? refreshListenable;

  String get location => _state.path;

  Map<String, String> get parameters => _state.parameters;

  Map<String, String> get queryParameters => _state.queryParameters;

  /// Navigate to a URI location
  void go(String path) {
    log('going to $path');
    _state = _parseTheRouterState(path, _templates);
    notifyListeners();
  }

  void pop() {
    final theRoutes = [..._state.routes]..removeLast();
    if (theRoutes.isEmpty) {
      throw Exception(
        'have popped the last page off of the stack; '
        'there are no pages left to show',
      );
    }
    final path = pathToFunction(theRoutes.last.path)(parameters);
    go(path);
  }

  /// Refresh the current location, including re-evaluating redirections.
  void refresh() {
    log('refreshing $location');
    go(location);
  }

  /// Convert the current routes to Flutter’s Page instances.
  List<Page> _buildPages(BuildContext context) {
    return [
      for (final route in _state.routes)
        kIsWeb
            ? NoTransitionPage(
                key: route.key,
                name: route.key.value,
                restorationId: route.key.value,
                arguments: _state.parameters,
                child: route.builder!(context, _state),
              )
            : MaterialPage(
                key: route.key,
                name: route.key.value,
                restorationId: route.key.value,
                arguments: _state.parameters,
                child: route.builder!(context, _state),
              )
    ];
  }

  @override
  void dispose() {
    refreshListenable?.removeListener(refresh);
    super.dispose();
  }
}

/// Informations about the location used to build pages and to define the
/// current configuration.
@freezed
class TheRouterState with _$TheRouterState {
  const factory TheRouterState({
    /// The full path of the current route (/authors/1?search=abc).
    required String path,
    // The current routes
    required List<TheRoute> routes,
    // The path template (/authors/:id)
    required String template,
    // The path parameters ({id: 1})
    @Default(<String, String>{}) Map<String, String> parameters,
    // The query parameters ({search: abc})
    @Default(<String, String>{}) Map<String, String> queryParameters,
  }) = _TheRouterState;
}

mixin TheRouterStateMixin {
  /// Convert [path] to [TheRouterState] from available [templates]
  TheRouterState _parseTheRouterState(String path, List<TheRoute> templates) {
    // Find list of [TheRoute] for each path segments
    final matches = templates.fold<List<TheRoute>>(
      [],
      (routes, element) {
        if (_uriMatch(element.path, Uri.parse(path))) routes.add(element);
        return routes;
      },
    )..sort();

    // Handle redirections
    final redirection = matches.last.redirect?.call();
    if (redirection != null) {
      return _parseTheRouterState(redirection, templates);
    }

    // Return all informations about this [path].
    return TheRouterState(
      path: path,
      template: matches.last.path,
      routes: matches.where((page) => page.builder != null).toList(),
      parameters: _extractParameters(matches.last.path, path),
      queryParameters: Uri.parse(path).queryParameters,
    );
  }

  /// Whether the [pattern] can match the [path].
  bool _uriMatch(String pattern, Uri path) {
    final uriPattern = Uri.parse(pattern);
    // the path segments in the pattern (['authors', ':id'])
    final patternSegments = uriPattern.pathSegments;

    // the path segments in the path (['authors', '1'])
    final exactSegment = path.pathSegments;
    if (exactSegment.length > 1 && exactSegment.last == '') {
      exactSegment.removeLast();
    }

    // retreive only the last route in web application.
    if (kIsWeb && exactSegment.length != patternSegments.length) {
      return false;
    }

    if (exactSegment.length < patternSegments.length) {
      return false;
    }

    for (var i = 0; i < patternSegments.length; i++) {
      if (patternSegments[i].startsWith(':')) {
        continue;
      }
      if (patternSegments[i] != exactSegment[i]) {
        return false;
      }
    }

    return true;
  }

  /// Extracts arguments from [path] and maps them by parameter name.
  Map<String, String> _extractParameters(String template, String path) {
    final parameters = <String>[];
    final regex = pathToRegExp(
      template,
      parameters: parameters,
      caseSensitive: false,
    );
    final match = regex.matchAsPrefix(path);

    return match != null ? extract(parameters, match) : {};
  }
}

/// [RouterDelegate] implementation used by the [Router] widget to build and
/// configure the navigating widget.
///
/// When there is new url:
/// - [RouteInformationParser.parseInformationRouter] is called which
///   converts the url to uri.
/// - [TheRouterDelegate.setNewRoutePath] is called, and update the state.
///
/// When [TheRouter.go] is called:
/// - [notifyListeners] is called to warn flutter that the url should be
///   synchronized.
/// - [TheRouterDelegate.currentConfiguration] is called which should convert
///   the state into a new uri.
/// - [TheRouteInformationParser.restoreRouteInformation] is called which
///   converts the uri to url.
class TheRouterDelegate extends TheRouter implements RouterDelegate<Uri> {
  TheRouterDelegate({
    GlobalKey<NavigatorState>? key,
    required List<TheRoute> templates,
    Listenable? refreshListenable,
  })  : _key = key ?? GlobalKey<NavigatorState>(),
        super(templates, refreshListenable);

  /// For use by the Router architecture.
  final GlobalKey<NavigatorState> _key;

  /// Called by router when it detects it may have changed because of a rebuild.
  @override
  Uri get currentConfiguration => Uri.parse(location);

  /// Called by the [Router] at startup with the structure that the
  /// [RouteInformationParser] obtained from parsing the initial route.
  @override
  Future<void> setInitialRoutePath(Uri configuration) {
    log('setInitialRoutePath to $configuration');
    final path = configuration.toString();
    if (path != '/') log('deep linking to $path');
    _state = _parseTheRouterState(path, _templates);

    // Use [SynchronousFuture] so that the initial url is processed
    // synchronously and remove unwanted initial animations on deep-linking.
    return SynchronousFuture(null);
  }

  /// Tells the app what to do when a new route comes in or how to deal with
  /// browser history.
  @override
  Future<void> setNewRoutePath(Uri configuration) {
    final path = configuration.toString();
    log('TheRouterDelegate.setNewRoutePath: $path');
    go(path);

    return SynchronousFuture(null);
  }

  @override
  Future<void> setRestoredRoutePath(Uri configuration) {
    log('TheRouterDelegate.setRestoredRoutePath: $configuration');
    return setNewRoutePath(configuration);
  }

  /// Handles back button presses from the OS.
  @override
  Future<bool> popRoute() {
    if (_state.routes.length > 1) {
      pop();
      return SynchronousFuture(true);
    }

    return SynchronousFuture(false);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedRouter(
      theRouter: this,
      child: Navigator(
        key: _key,
        pages: _buildPages(context),
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          pop();
          return true;
        },
      ),
    );
  }
}

/// Allow to find the current TheRouter in the widget tree.
class InheritedRouter extends InheritedWidget {
  const InheritedRouter({
    required Widget child,
    required this.theRouter,
    Key? key,
  }) : super(child: child, key: key);

  /// The [TheRouter] that is made available to the widget tree.
  final TheRouter theRouter;

  /// Used by the Router architecture as part of the InheritedWidget.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // avoid rebuilding the widget tree if the router has not changed
    return false;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TheRouter>('theRouter', theRouter));
  }
}

/// This class can be used to make `refreshListenable` react to events in the
/// the provided stream.
class TheRouterRefreshStream extends ChangeNotifier {
  /// Every time the [stream] receives an event the [TheRouter] will refresh its
  /// current route.
  TheRouterRefreshStream(Stream stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
