import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase/presentation/app/app.dart';
import 'package:supabase/presentation/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: App()),
      );
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}
