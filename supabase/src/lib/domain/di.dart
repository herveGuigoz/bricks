import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app/adapters/repositories/session.dart';
import 'package:app/domain/ports/session.dart';

abstract class Dependency {
  static Provider<SessionRepositoryInterface> get sessionRepository => _sessionRepository;
}

final _sessionRepository = Provider<SessionRepositoryInterface>(
  (ref) => SessionRepository(),
  name: 'SessionRepositoryProvider',
);
