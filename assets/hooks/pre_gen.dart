import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final directory = Directory(context.vars['directory'] as String);
  final files = directory.listSync(recursive: true).whereType<File>();

  final assets = files
      .where((file) => ['png', 'svg'].contains(file.type))
      .map((file) => {'name': file.path.name.camelCase, 'path': file.uri.path})
      .toList();

  assets.sort((a, b) => a['name']!.compareTo(b['name']!));

  context.vars['assets'] = assets;
  context.vars['svg'] = assets.where((asset) => asset['path']!.endsWith('.svg')).toList();
  context.vars['images'] = assets.where((asset) => asset['path']!.endsWith('.png')).toList();

  context.logger.info('Found ${assets.length} assets in ${directory.uri}');
}

extension on String {
  /// Remove the extension from a file name.
  String get name {
    return last.split('.').first;
  }

  /// remove the path from a file name.
  String get last {
    return split('/').last;
  }
}

extension on File {
  String get type {
    return path.split('.').last;
  }
}
