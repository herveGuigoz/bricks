import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{name.snakeCase()}}/l10n.dart';
import 'package:{{name.snakeCase()}}/presentation/app/bloc/navigation.dart';
import 'package:{{name.snakeCase()}}/presentation/shared/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeDataProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Supabase',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
