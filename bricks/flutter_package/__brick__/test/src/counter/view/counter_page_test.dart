import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/counter/counter.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });

  group('CounterView', () {
    late CounterController controller;

    testWidgets('renders current count', (tester) async {
      const state = 21;
      controller = CounterController(state);

      await tester.pumpApp(
        const CounterPage(),
        overrides: [
          counterControllerProvider.overrideWithValue(controller),
        ],
      );

      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets(
      'calls increment when increment button is tapped',
      (tester) async {
        controller = CounterController();

        await tester.pumpApp(
          const CounterPage(),
          overrides: [
            counterControllerProvider.overrideWithValue(controller),
          ],
        );

        await tester.tap(find.byIcon(Icons.add));
        expect(controller.debugState, equals(1));
      },
    );

    testWidgets(
      'calls decrement when decrement button is tapped',
      (tester) async {
        controller = CounterController();

        await tester.pumpApp(
          const CounterPage(),
          overrides: [
            counterControllerProvider.overrideWithValue(controller),
          ],
        );

        await tester.tap(find.byIcon(Icons.remove));
        expect(controller.debugState, equals(-1));
      },
    );
  });
}
