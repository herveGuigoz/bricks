import 'package:flutter/widgets.dart';
import 'package:{{name.snakeCase()}}/bootstrap.dart';
import 'package:{{name.snakeCase()}}/presentation/{{name.snakeCase()}}/{{name.snakeCase()}}.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
