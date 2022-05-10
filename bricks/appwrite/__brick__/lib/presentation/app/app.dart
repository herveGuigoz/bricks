import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name}}/application/authentication/authentication.dart';
import 'package:{{name}}/presentation/authentication/login/login_view.dart';
import 'package:{{name}}/presentation/authentication/register/register_view.dart';
import 'package:{{name}}/presentation/home/home_view.dart';

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  /// Convert [Stream] to [Listenable] in order to update the router on new
  /// authentication.
  late final _listenable = GoRouterRefreshStream(
    ref.read(authStateProvider.notifier).stream,
  );

  /// GoRouter configuration.
  late final _router = GoRouter(
    refreshListenable: _listenable,
    routes: [
      GoRoute(
        path: HomeView.path,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: LoginView.path,
        builder: (context, state) => const LoginView(),
        redirect: (state) => authState.map(
          authenticated: (_) => '/',
          unauthenticated: (_) => null,
        ),
      ),
      GoRoute(
        path: RegisterView.path,
        builder: (context, state) => const RegisterView(),
        redirect: (state) => authState.map(
          authenticated: (_) => '/',
          unauthenticated: (_) => null,
        ),
      ),
    ],
    redirect: (state) {
      return ![LoginView.path, RegisterView.path].contains(state.location) &&
              authState is Unauthenticated
          ? LoginView.path
          : null;
    },
  );

  AuthState get authState => ref.read(authStateProvider);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Stockito',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
