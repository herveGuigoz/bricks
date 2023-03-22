import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{name.snakeCase()}}/presentation/app/app.dart';
import 'package:{{name.snakeCase()}}/presentation/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: {{name.pascalCase()}}()),
      );
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
