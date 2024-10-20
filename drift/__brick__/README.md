# SQLite as a NoSQL Store

SQLite is a very capable edge database that can store various shapes of data.

NoSQL databases are very popular due to the schema-less nature of storing of the data but it is totally possible to store these documents in SQLite.

SQLite actually has great JSON support and even supports JSONB.


## Setup

Install the following packages:

```bash
dart pub add drift drift_flutter dev:drift_dev dev:build_runner
```

## Usage

Here is an example of how to use AppDatabase to store Session data:

```dart
/// Read and write sessions to storage.
class SessionsStorage {
  const SessionsStorage({
    required AppDatabase database,
  }) : _database = database;

  static const String key = 'session';

  final AppDatabase _database;

  Future<Session?> read() async {
    final session = await _database.find(key).getSingleOrNull();

    return switch (session?.data) {
      final String value => Session.fromJson(jsonDecode(value) as Map<String, dynamic>),
      null => null,
    };
  }

  Future<void> save(Session session) async {
    await _database.transaction(() async {
      await _database.insert(key, jsonEncode(session.toJson()), DateTime.now().secondsSinceEpoch + 1209600);
    });
  }

  Future<void> clear() async {
    await _database.transaction(() async {
      await _database.remove(key);
    });
  }
}

extension on DateTime {
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
}
```
