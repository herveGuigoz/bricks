import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/counter/counter.dart';

final counterControllerProvider = StateNotifierProvider<CounterController, int>(
  (ref) => CounterController(),
);
