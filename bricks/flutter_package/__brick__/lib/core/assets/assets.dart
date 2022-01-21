import 'package:flutter/widgets.dart';

/// A Dart object which holds metadata for a given asset.
class Asset {
  const Asset({
    required this.name,
    required this.path,
    required this.size,
  });

  /// The name of the image.
  final String name;

  /// The path to the asset.
  final String path;

  /// The size of the asset.
  final Size size;
}