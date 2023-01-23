import 'package:flutter/widgets.dart';
import 'package:{{name.snakeCase()}}/bootstrap.dart';
import 'package:{{name.snakeCase()}}/presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
