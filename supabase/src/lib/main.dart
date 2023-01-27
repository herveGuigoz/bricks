import 'package:flutter/widgets.dart';
import 'package:app/bootstrap.dart';
import 'package:app/presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
