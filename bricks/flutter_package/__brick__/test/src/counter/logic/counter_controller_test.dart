import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/counter/counter.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('CounterController', () {
    late ProviderContainer container;

    setUp(() {
      container = createContainer();
    });

    test('initial state is 0', () {
      final count = container.read(counterControllerProvider);
      expect(count, equals(0));
    });

    test('emits [1] when increment is called', () {
      container.read(counterControllerProvider.notifier).increment();
      final count = container.read(counterControllerProvider);
      expect(count, equals(1));
    });

    test('emits [-1] when decrement is called', () {
      container.read(counterControllerProvider.notifier).decrement();
      final count = container.read(counterControllerProvider);
      expect(count, equals(-1));
    });
  });
}
