import 'package:flutter/widgets.dart';
import 'package:supabase/bootstrap.dart';
import 'package:supabase/presentation/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
