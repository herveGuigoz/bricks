part of 'http.dart';

/// Accept secure connection with bad certifiacte.
///
/// ```dart
/// Future<void> main() async {
///   HttpOverrides.runWithHttpOverrides(() {
///     bootstrap(() => const ProviderScope(child: Main()));
///   }, HandshakeOverride());
/// }
/// ```
class HandshakeOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
