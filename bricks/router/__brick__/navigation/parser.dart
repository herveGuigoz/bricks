part of 'navigation.dart';

/// TheRouter implementation of the RouteInformationParser base class.
/// Convert incoming URLs back and forth.
class TheRouteInformationParser extends RouteInformationParser<Uri> {
  /// The route or path that the embedder requested when the application was
  /// launched.
  static final initialRoute = PlatformDispatcher.instance.defaultRouteName;

  /// Get a location (path) from the system and build related [URI]
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture(
      Uri.parse(routeInformation.location ?? initialRoute),
    );
  }

  /// Update the URL bar with the latest [URI] from the app
  @override
  RouteInformation restoreRouteInformation(Uri configuration) {
    return RouteInformation(location: configuration.toString());
  }
}
