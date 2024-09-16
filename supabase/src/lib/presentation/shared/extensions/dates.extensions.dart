const String _defaultLocale = 'en';

extension DateTimeTimeExtension on DateTime {
  /// Adds this DateTime and Duration and returns the sum as a new DateTime object.
  DateTime operator +(Duration duration) => add(duration);

  /// Subtracts the Duration from this DateTime returns the difference as a new
  /// DateTime object.
  DateTime operator -(Duration duration) => subtract(duration);

  /// Formats this DateTime as a string ('01 jan. 2000').
  String ddMMMy([String locale = _defaultLocale]) {
    final intl = DateFormat('dd MMM. y', locale);

    return intl.format(this).toTitleCase();
  }

  /// Formats this DateTime as a string with Day and Month only ('01 jan').
  String ddMMM([String locale = _defaultLocale]) {
    final intl = DateFormat('dd MMM', locale);

    return intl.format(this).toTitleCase();
  }

  /// Formats this DateTime as a string ('01 january 2000').
  String ddMMMMy([String locale = _defaultLocale]) {
    final intl = DateFormat('dd MMMM y', locale);

    return intl.format(this).toTitleCase();
  }
}
