import 'package:mason/mason.dart';

void run(HookContext context) {
  final styles = context.vars['styles'] as List<dynamic>;
  
  context.vars = {
    ...context.vars,
    'docker': styles.contains('Docker'),
    'flutter': styles.contains('Flutter'),
    'symfony': styles.contains('Symfony'),
  };
  print(context.vars);
}
