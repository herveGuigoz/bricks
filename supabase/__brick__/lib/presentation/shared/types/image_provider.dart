// ignore_for_file: avoid_unused_constructor_parameters

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AdaptiveImageProvider extends ImageProvider {
  AdaptiveImageProvider(
    String url, {
    Map<String, String>? headers,
  }) : _delegate = _resolve(url, headers);

  factory AdaptiveImageProvider.of(BuildContext context, {required String url}) {
    return AdaptiveImageProvider(url);
  }

  final ImageProvider _delegate;

  static ImageProvider _resolve(String url, [Map<String, String>? headers]) {
    final uri = Uri.parse(url);

    switch (uri.scheme) {
      case 'asset':
        final path = uri.toString().replaceFirst('asset://', '');
        return AssetImage(path);
      case 'http':
      case 'https':
        return CachedNetworkImageProvider(url, headers: headers);
      case 'file':
      default:
        final file = File.fromUri(uri);
        return FileImage(file);
    }
  }

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture(_delegate.obtainKey(configuration));
  }
}
