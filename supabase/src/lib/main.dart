import 'package:app_name/bootstrap.dart';
import 'package:app_name/presentation/app/app.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const AppName());
}
