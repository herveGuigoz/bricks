import 'package:mason/mason.dart';

void run(HookContext context) {
  final name = context.vars['name'] as String;
  final organization = context.vars['organization'] as String;

  context.vars['android_package'] = '$organization.${name.snakeCase}';
  context.vars['ios_bundle'] = '$organization.${name.paramCase}';
}
