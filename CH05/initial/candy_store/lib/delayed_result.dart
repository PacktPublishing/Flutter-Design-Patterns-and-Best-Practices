import 'package:freezed_annotation/freezed_annotation.dart';

part 'delayed_result.freezed.dart';

@freezed
sealed class DelayedResult<T> with _$DelayedResult<T> {
  const DelayedResult._();

  const factory DelayedResult.idle() = _Idle<T>;
  const factory DelayedResult.inProgress() = _InProgress<T>;
  const factory DelayedResult.fromValue(T value) = _FromValue<T>;
  const factory DelayedResult.fromError(Exception error) = _FromError<T>;

  bool get isSuccessful => this is _FromValue<T>;
  bool get isError => this is _FromError<T>;
  bool get isIdle => this is _Idle<T>;
  bool get isInProgress => this is _InProgress<T>;
  T? get value => this is _FromValue<T> ? (this as _FromValue<T>).value : null;
  Exception? get error => this is _FromError<T> ? (this as _FromError<T>).error : null;
}
