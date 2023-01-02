import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase/domain/ports/session.dart';
import 'package:supabase/presentation/app/bloc/presenter.dart';
import 'package:supabase/presentation/counter/counter.dart';
import 'package:supabase/presentation/login/view/login.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    refreshListenable: AppStateRefreshStream(
      ref.read(AppPresenter.state.notifier).stream,
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
      final location = state.location;

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
  AppStateRefreshStream(Stream<AuthenticationStatus> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<Object> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
