import 'package:meta/meta.dart';

/// Base Result class
///
/// Receives two values [E] and [S] as [E] is an error and [S] is a success.
@sealed
abstract class Result<E, S> {
  /// Default constructor.
  const Result();

  /// Returns the value of [S].
  S? getSuccess();

  /// Returns the value of [E].
  E? getError();

  /// Returns true if the current result is an [Error].
  bool isError();

  /// Returns true if the current result is a [success].
  bool isSuccess();

  /// Return the result in one of these functions.
  ///
  /// if the result is an error, it will be returned in [whenError],
  /// if it is a success it will be returned in [whenSuccess].
  W when<W>({
    required W Function(E error) error,
    required W Function(S data) success,
  });
}

/// Success Result.
@immutable
class Success<E, S> implements Result<E, S> {
  /// Receives the [S] param as the successful result.
  const Success(this._success);

  final S _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Success && other._success == _success;

  @override
  W when<W>({
    required W Function(E error) error,
    required W Function(S data) success,
  }) {
    return whenSuccess(_success);
  }

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;
}

/// Error Result.
@immutable
class Error<E, S> implements Result<E, S> {
  /// Receives the [E] param as the error result.
  const Error(this._error);

  final E _error;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _error.hashCode;

  @override
  bool operator ==(Object other) => other is Error && other._error == _error;

  @override
  W when<W>({
    required W Function(E error) error,
    required W Function(S data) success,
  }) {
    return whenError(_error);
  }

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;
}

/// Default success class.
///
/// Instead of returning void, as
/// ```dart
///   Result<Exception, void>
/// ```
/// return
/// ```dart
///   Result<Exception, SuccessResult>
/// ```
class SuccessResult {
  const SuccessResult._internal();
}

/// Default success case.
const success = SuccessResult._internal();
