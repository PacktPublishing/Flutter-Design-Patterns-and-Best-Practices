// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delayed_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DelayedResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DelayedResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DelayedResult<$T>()';
  }
}

/// @nodoc
class $DelayedResultCopyWith<T, $Res> {
  $DelayedResultCopyWith(
      DelayedResult<T> _, $Res Function(DelayedResult<T>) __);
}

/// Adds pattern-matching-related methods to [DelayedResult].
extension DelayedResultPatterns<T> on DelayedResult<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle<T> value)? idle,
    TResult Function(_InProgress<T> value)? inProgress,
    TResult Function(_FromValue<T> value)? fromValue,
    TResult Function(_FromError<T> value)? fromError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _InProgress() when inProgress != null:
        return inProgress(_that);
      case _FromValue() when fromValue != null:
        return fromValue(_that);
      case _FromError() when fromError != null:
        return fromError(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle<T> value) idle,
    required TResult Function(_InProgress<T> value) inProgress,
    required TResult Function(_FromValue<T> value) fromValue,
    required TResult Function(_FromError<T> value) fromError,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle(_that);
      case _InProgress():
        return inProgress(_that);
      case _FromValue():
        return fromValue(_that);
      case _FromError():
        return fromError(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle<T> value)? idle,
    TResult? Function(_InProgress<T> value)? inProgress,
    TResult? Function(_FromValue<T> value)? fromValue,
    TResult? Function(_FromError<T> value)? fromError,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _InProgress() when inProgress != null:
        return inProgress(_that);
      case _FromValue() when fromValue != null:
        return fromValue(_that);
      case _FromError() when fromError != null:
        return fromError(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    TResult Function(T value)? fromValue,
    TResult Function(Exception error)? fromError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _InProgress() when inProgress != null:
        return inProgress();
      case _FromValue() when fromValue != null:
        return fromValue(_that.value);
      case _FromError() when fromError != null:
        return fromError(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
    required TResult Function(T value) fromValue,
    required TResult Function(Exception error) fromError,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle();
      case _InProgress():
        return inProgress();
      case _FromValue():
        return fromValue(_that.value);
      case _FromError():
        return fromError(_that.error);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? inProgress,
    TResult? Function(T value)? fromValue,
    TResult? Function(Exception error)? fromError,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _InProgress() when inProgress != null:
        return inProgress();
      case _FromValue() when fromValue != null:
        return fromValue(_that.value);
      case _FromError() when fromError != null:
        return fromError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Idle<T> extends DelayedResult<T> {
  const _Idle() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Idle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DelayedResult<$T>.idle()';
  }
}

/// @nodoc

class _InProgress<T> extends DelayedResult<T> {
  const _InProgress() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InProgress<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DelayedResult<$T>.inProgress()';
  }
}

/// @nodoc

class _FromValue<T> extends DelayedResult<T> {
  const _FromValue(this.value) : super._();

  final T value;

  /// Create a copy of DelayedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FromValueCopyWith<T, _FromValue<T>> get copyWith =>
      __$FromValueCopyWithImpl<T, _FromValue<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FromValue<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'DelayedResult<$T>.fromValue(value: $value)';
  }
}

/// @nodoc
abstract mixin class _$FromValueCopyWith<T, $Res>
    implements $DelayedResultCopyWith<T, $Res> {
  factory _$FromValueCopyWith(
          _FromValue<T> value, $Res Function(_FromValue<T>) _then) =
      __$FromValueCopyWithImpl;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$FromValueCopyWithImpl<T, $Res>
    implements _$FromValueCopyWith<T, $Res> {
  __$FromValueCopyWithImpl(this._self, this._then);

  final _FromValue<T> _self;
  final $Res Function(_FromValue<T>) _then;

  /// Create a copy of DelayedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_FromValue<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _FromError<T> extends DelayedResult<T> {
  const _FromError(this.error) : super._();

  final Exception error;

  /// Create a copy of DelayedResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FromErrorCopyWith<T, _FromError<T>> get copyWith =>
      __$FromErrorCopyWithImpl<T, _FromError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FromError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'DelayedResult<$T>.fromError(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FromErrorCopyWith<T, $Res>
    implements $DelayedResultCopyWith<T, $Res> {
  factory _$FromErrorCopyWith(
          _FromError<T> value, $Res Function(_FromError<T>) _then) =
      __$FromErrorCopyWithImpl;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$FromErrorCopyWithImpl<T, $Res>
    implements _$FromErrorCopyWith<T, $Res> {
  __$FromErrorCopyWithImpl(this._self, this._then);

  final _FromError<T> _self;
  final $Res Function(_FromError<T>) _then;

  /// Create a copy of DelayedResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_FromError<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

// dart format on
