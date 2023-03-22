import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:app_name/presentation/counter/counter.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      final container = ProviderContainer();
      expect(container.read(counterPresenter), equals(0));
    });

    test('update state when increment is called', () {
      final container = ProviderContainer();
      container.read(counterPresenter.notifier).increment();
      expect(container.read(counterPresenter), equals(2));
    });

    test('update state when decrement is called', () {
      final container = ProviderContainer();
      container.read(counterPresenter.notifier).decrement();
      expect(container.read(counterPresenter), equals(-1));
    });
  });
}
