import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/app/app.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/bootstrap.dart';

void main() {
  bootstrap(() => const ProviderScope(child: App()));
}
