import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/counter/logic/counter_logic.dart';

final counterControllerProvider = StateNotifierProvider<CounterController, int>(
  (ref) => CounterController(),
);
