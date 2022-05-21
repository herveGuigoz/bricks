import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/application/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/home/home_view.dart';

const _authLocations = ['/login', '/register'];

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(
      ref.read(authStateProvider.notifier).stream,
    ),
    routes: [
      GoRoute(
        name: HomeView.name,
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: LoginView.name,
        path: '/login',
        builder: (context, state) => LoginView(key: state.pageKey),
      ),
      GoRoute(
        name: RegisterView.name,
        path: '/register',
        builder: (context, state) => RegisterView(key: state.pageKey),
      ),
    ],
    redirect: (state) {
      final isAuthenticated = ref.read(authStateProvider) is Authenticated;

      if (!isAuthenticated && !_authLocations.contains(state.location)) {
        return '/login';
      }

      if (isAuthenticated && _authLocations.contains(state.location)) {
        return '/';
      }

      return null;
    },
  );
});
