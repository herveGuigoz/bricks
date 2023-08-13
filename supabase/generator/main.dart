import 'dart:io';
import 'package:path/path.dart' as path;
import 'command.dart';

Future<void> main() async {
  final source = path.join('src/');
  final target = path.join('__brick__');
  final android = path.join(target, 'android');

  final directory = Directory(target);

  // Remove Previously Generated Files
  if (directory.existsSync()) {
    await directory.delete(recursive: true);
  }

  // Copy Project Files
  await Command.mkdir(target);
  await Command.cp(source, target);

  // Delete ignored files
  directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.isIgnored())
      .forEach((file) => file.deleteSync());

  final files = directory.listSync(recursive: true).whereType<File>();

  // Convert Values to Variables
  for (final file in files) {
    if (file.isImage()) continue;

    final isAndroid = path.isWithin(android, file.path);

    var content = await file.readAsString();

    if (isAndroid && file.path.endsWith('build.gradle')) {
      content = content.replaceAll('com.example.app_name', '{{android_package}}');
    }

    content = content.replaceAll('app_name', '{{name.snakeCase()}}');
    content = content.replaceAll('AppName', '{{name.pascalCase()}}');

    await file.writeAsString(content);
  }

  // Replace MainActivity.kt file
  final mainActivityPath = path.join(android, 'app', 'src', 'main', 'kotlin');
  final mainActivity = File(
    path.join(mainActivityPath, '{{organization.pathCase()}}', '{{name.snakeCase()}}', 'MainActivity.kt'),
  );
  await Command.rm(path.join(mainActivityPath));
  await Command.mkdir(mainActivity.parent.path);
  await Command.cp(path.join('generator', 'static', 'MainActivity.kt'), mainActivity.path);
}

extension on File {
  bool isIgnored() {
    final result = Process.runSync(
      'git',
      'check-ignore ${this.path} --quiet'.split(' '),
    );

    return result.exitCode == 0;
  }

  bool isImage() {
    return this.path.endsWith('.png');
  }
}
