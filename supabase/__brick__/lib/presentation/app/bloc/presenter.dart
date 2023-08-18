import 'dart:async';
import 'dart:developer';

import 'package:{{name.snakeCase()}}/application/providers/providers.dart';
import 'package:{{name.snakeCase()}}/domain/entities/entities.dart';
import 'package:{{name.snakeCase()}}/domain/ports/session.dart';
import 'package:{{name.snakeCase()}}/presentation/app/bloc/deep_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef AppStateNotifierProvider = StateNotifierProvider<_AppStateNotifier, User?>;

typedef IsAuthenticatedProvider = Provider<bool>;

abstract class AppPresenter {
  static AppStateNotifierProvider get state => _appStateProvider;

  static IsAuthenticatedProvider get isAuthenticated => _isAuthenticatedProvider;
}

final _appStateProvider = AppStateNotifierProvider(
  (ref) => _AppStateNotifier(ref.watch(Dependency.sessionRepository)),
  name: 'AppStateNotifierProvider',
);

final _isAuthenticatedProvider = Provider<bool>(
  (ref) => ref.watch(_appStateProvider) != null,
  name: 'IsAuthenticatedProvider',
);

class _AppStateNotifier extends StateNotifier<User?> with DeepLinkObserverMixin {
  _AppStateNotifier(this._sessionRepository) : super(_sessionRepository.recoverSession()) {
    startDeeplinkObserver();
    _sessionRepository.currentUser.listen((user) => state = user);
  }

  final SessionRepositoryInterface _sessionRepository;

  @override
  Future<void> handleDeeplink(Uri uri) async {
    final status = await _sessionRepository.handleDeeplink('$uri');
    if (status != null) state = status;
  }

  @override
  void onErrorReceivingDeeplink(String message) {
    log(message, name: 'onErrorReceivingDeeplink');
  }

  Future<void> signOut() async {
    await _sessionRepository.signOut();
    state = null;
  }
}
