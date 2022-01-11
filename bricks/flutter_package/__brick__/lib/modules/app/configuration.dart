// ignore_for_file: do_not_use_environment

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// App configuration provider
final configurationProvider = Provider((ref) => const Configuration());

/// App configuration
class Configuration {
  const Configuration({
    this.baseURL = const String.fromEnvironment('BASE_URL'),
  });

  /// Server endpoint
  final String baseURL;
}
