import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// A Dart object which holds metadata for a given asset.
class Asset extends Equatable {
  const Asset({required this.name, required this.path});

  factory Asset.fromName(String name) {
    return [
      ...Assets.images,
      ...Assets.vectors,
    ].firstWhere((element) => element.name == name);
  }

  /// The name of the image.
  final String name;

  /// The path to the asset.
  final String path;

  @override
  List<Object?> get props => [name, path];
}

/// A class that holds all the assets used in the application.
class Assets {
  
  /// Prefetches assets images into the image cache.
  static Future<void> precacheImages(BuildContext context) async {
    await Future.wait<void>([
      {{#images}}
      precacheImage(AssetImage({{name}}.path), context),
      {{/images}}
    ]);
  }

  static const images = <Asset>[
    {{#images}}
    {{name}},
    {{/images}}
  ];

  static const vectors = <Asset>[
    {{#svg}}
    {{name}},
    {{/svg}}
  ];

  {{#assets}}
  /// {{path}}
  static const {{name}} = Asset(
    name: '{{name.paramCase()}}',
    path: '{{path}}',
  );
  {{/assets}}
}
