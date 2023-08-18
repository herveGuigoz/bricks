import 'dart:async';

import 'package:app_name/presentation/app/bloc/presenter.dart';
import 'package:app_name/presentation/counter/counter.dart';
import 'package:app_name/presentation/login/view/login.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    refreshListenable: AppStateRefreshStream(
      ref.read(AppPresenter.state.notifier).stream.distinct(),
    ),
    routes: [
      GoRoute(
        path: '/',
        name: 'Counter',
        builder: (context, state) => const CounterView(),
      ),
      GoRoute(
        path: '/login',
        name: 'Login',
        builder: (context, state) => const LoginView(),
      ),
    ],
    redirect: (context, state) {
      final isAuthenticated = ref.read(AppPresenter.isAuthenticated);
      final location = state.uri.path;

      if (!isAuthenticated && location != '/login') {
        return '/login';
      }

      if (isAuthenticated && location == '/login') {
        return '/';
      }

      return null;
    },
  ),
  name: 'RouterProvider',
);

class AppStateRefreshStream extends ChangeNotifier {
  AppStateRefreshStream(Stream<Object?> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
