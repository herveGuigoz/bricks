import 'package:app_name/adapters/repositories/session.repository.dart';
import 'package:app_name/domain/ports/session.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Dependency {
  static Provider<SessionRepositoryInterface> get sessionRepository => _sessionRepository;
}

final _sessionRepository = Provider<SessionRepositoryInterface>(
  (ref) => SessionRepository(),
  name: 'SessionRepositoryProvider',
);
