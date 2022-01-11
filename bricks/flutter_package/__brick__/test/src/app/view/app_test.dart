import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/app/app.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/modules/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
