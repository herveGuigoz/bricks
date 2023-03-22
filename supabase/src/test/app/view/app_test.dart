import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app_name/presentation/app/app.dart';
import 'package:app_name/presentation/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: AppName()),
      );
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
