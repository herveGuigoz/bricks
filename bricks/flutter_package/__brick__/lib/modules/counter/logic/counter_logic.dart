import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends StateNotifier<int> {
  CounterController([int? state]) : super(state ?? 0);

  void increment() => state = state + 1;
  void decrement() => state = state - 1;
}
