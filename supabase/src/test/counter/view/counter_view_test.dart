import 'package:app_name/presentation/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterView', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const CounterView());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterLayout', () {
    testWidgets('renders current count', (tester) async {
      const state = 1;

      await tester.pumpApp(const CounterView());

      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped', (tester) async {
      const state = 2;
      await tester.pumpApp(const CounterView());
      await tester.tap(find.byIcon(Icons.add));
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls decrement when decrement button is tapped', (tester) async {
      const state = 0;
      await tester.pumpApp(const CounterView());
      await tester.tap(find.byIcon(Icons.remove));
      expect(find.text('$state'), findsOneWidget);
    });
  });
}
