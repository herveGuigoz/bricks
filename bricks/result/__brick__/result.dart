import 'package:flutter/foundation.dart';

abstract class Result<T> {
  const factory Result.success(
    T value,
  ) = Success<T>;

  const factory Result.failure(
    Object error, [
    StackTrace? stackTrace,
  ]) = Failure<T>;

  /// Transforms a [Future] that may fail
  static Future<Result<T>> guard<T>(Future<T> Function() future) async {
    try {
      return Result.success(await future());
    } catch (err, stackTrace) {
      return Result.failure(err, stackTrace);
    }
  }

  R map<R>({
    required R Function(Failure<T> failure) failure,
    required R Function(Success<T> success) success,
  });
}

@immutable
class Success<T> implements Result<T> {
  const Success(this.value);

  final T value;

  @override
  R map<R>({
    required R Function(Failure<T> failure) failure,
    required R Function(Success<T> success) success,
  }) {
    return success(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Success<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success(value: $value)';
}

@immutable
class Failure<T> implements Result<T> {
  const Failure(this.error, [this.stackTrace]);

  /// The error.
  final Object error;

  /// The stacktrace of [error].
  final StackTrace? stackTrace;

  String get message => error.toString();

  @override
  R map<R>({
    required R Function(Failure<T> failure) failure,
    required R Function(Success<T> success) success,
  }) {
    return failure(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure<T> &&
        other.error == error &&
        other.stackTrace == stackTrace;
  }

  @override
  int get hashCode => error.hashCode ^ stackTrace.hashCode;

  @override
  String toString() => 'Failure(error: $error, stackTrace: $stackTrace)';
}

extension ResultX<T> on Result<T> {
  R when<R>({
    required R Function(T data) data,
    required R Function(Object error, StackTrace? stackTrace) error,
  }) {
    return map(
      success: (success) => data(success.value),
      failure: (failure) => error(failure.error, failure.stackTrace),
    );
  }

  R? onSuccess<R>(R Function(T value) cb) {
    return map(failure: (_) => null, success: (success) => cb(success.value));
  }

  R? onError<R>(R Function(Failure<T> failure) cb) {
    return map(failure: cb, success: (_) => null);
  }
}
