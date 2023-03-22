import 'dart:io';
import 'package:path/path.dart' as path;
import 'command.dart';

Future<void> main() async {
  final source = path.join('src/');
  final target = path.join('__brick__', '{{name.snakeCase()}}');

  final directory = Directory(target);

  // Copy Project Files
  await Command.cp(source, target);

  final files = directory.listSync(recursive: true).whereType<File>();

  for (final file in files) {
    var content = await file.readAsString();
    content = content.replaceAll('app_name', '{{name.snakeCase()}}');
    content = content.replaceAll('AppName', '{{name.pascalCase()}}');

    await file.writeAsString(content);
  }
}
