import 'dart:io';

class Command {
  static Future<void> cp(String source, String destination) {
    return Command.run('cp', ['-rf', source, destination]);
  }

  static Future<void> mkdir(String destination) {
    return Command.run('mkdir', ['-p', destination]);
  }

  static Future<void> rm(String source) async {
    await Command.run('rm', ['-rf', source]);
  }

  static Future<void> rename(String source, String destination) async {
    await Command.cp('$source/', '$destination/');
    await Command.run('rm', ['-rf', source]);
  }

  static Future<ProcessResult> run(
    String cmd,
    List<String> args, {
    bool throwOnError = true,
    String? processWorkingDir,
  }) async {
    final result = await Process.run(
      cmd,
      args,
      workingDirectory: processWorkingDir,
      runInShell: true,
    );

    if (throwOnError) {
      _throwIfProcessFailed(result, cmd, args);
    }
    return result;
  }

  static void _throwIfProcessFailed(
    ProcessResult pr,
    String process,
    List<String> args,
  ) {
    if (pr.exitCode != 0) {
      final values = {'Standard out': pr.stdout.toString().trim(), 'Standard error': pr.stderr.toString().trim()}
        ..removeWhere((k, v) => v.isEmpty);

      String message;
      if (values.isEmpty) {
        message = 'Unknown error';
      } else if (values.length == 1) {
        message = values.values.single;
      } else {
        message = values.entries.map((e) => '${e.key}\n${e.value}').join('\n');
      }

      throw ProcessException(process, args, message, pr.exitCode);
    }
  }
}
