import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterPresenter = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 1;

  void increment() => state = state + 1;
  void decrement() => state = state - 1;
}
