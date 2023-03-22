import 'package:flutter/widgets.dart';
import 'package:app_name/bootstrap.dart';
import 'package:app_name/presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const AppName());
}
