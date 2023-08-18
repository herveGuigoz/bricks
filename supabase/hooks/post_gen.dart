import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  var progress = context.logger.progress('Getting dependencies');
  await pubGet('.');
  await pubGet('./packages/api_client');

  progress.update('Generating code.');
  await build('.');

  progress.update('Formating source code.');
  await dartFormat('lib');
  await dartFormat('packages/api_client/lib');

  progress.update('Fixing source code.');
  await dartFix('.');
  await dartFix('./packages/api_client');

  progress.complete('Flutter project successfully created!');
}

Future<void> pubGet(String path) async {
  await shell('flutter', args: ['pub', 'get'], workingDirectory: path);
}

Future<void> build(String path) async {
  await shell(
    'flutter',
    args: ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: path,
  );
}

Future<void> dartFormat(String path) async {
  await shell('dart', args: ['format', '--line-length', '120', path]);
}

Future<void> dartFix(String path) async {
  await shell('dart', args: ['fix', '--apply'], workingDirectory: path);
}

Future<void> shell(String command, {List<String> args = const [], String? workingDirectory}) async {
  final result = await Process.run(
    command,
    args,
    workingDirectory: workingDirectory,
    runInShell: true,
  );

  if (result.exitCode != 0) {
    var message = 'Unknown error';

    final values = {'Standard out': result.stdout.toString().trim(), 'Standard error': result.stderr.toString().trim()}
      ..removeWhere((k, v) => v.isEmpty);

    if (values.isNotEmpty) {
      message = values.entries.map((e) => '${e.key}\n${e.value}').join('\n');
    }

    throw ProcessException(command, args, message, result.exitCode);
  }
}
