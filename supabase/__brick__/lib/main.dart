import 'package:{{name.snakeCase()}}/bootstrap.dart';
import 'package:{{name.snakeCase()}}/presentation/app/app.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const {{name.pascalCase()}}());
}
