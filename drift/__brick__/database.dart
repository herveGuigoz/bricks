import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

/// {@template app_database}
/// The drift-managed database configuration
/// {@endtemplate}
@DriftDatabase(include: {'sql/schema.drift', 'sql/queries.drift'})
class AppDatabase extends _$AppDatabase {
  /// {@macro app_database}
  AppDatabase() : super(_openConnection());

  static QueryExecutor _openConnection() {
    return driftDatabase(name: '{{name}}');
  }

  @override
  int get schemaVersion => 1;
}
