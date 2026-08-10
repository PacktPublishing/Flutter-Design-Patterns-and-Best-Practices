// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState {
  Map<String, CartListItem> get items;
  double get totalPrice;
  int get totalItems;
  DelayedResult<void> get loadingResult;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartStateCopyWith<CartState> get copyWith =>
      _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartState &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.loadingResult, loadingResult) ||
                other.loadingResult == loadingResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      totalPrice,
      totalItems,
      loadingResult);

  @override
  String toString() {
    return 'CartState(items: $items, totalPrice: $totalPrice, totalItems: $totalItems, loadingResult: $loadingResult)';
  }
}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) =
      _$CartStateCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, CartListItem> items,
      double totalPrice,
      int totalItems,
      DelayedResult<void> loadingResult});

  $DelayedResultCopyWith<void, $Res> get loadingResult;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalPrice = null,
    Object? totalItems = null,
    Object? loadingResult = null,
  }) {
    return _then(CartState(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, CartListItem>,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      loadingResult: null == loadingResult
          ? _self.loadingResult
          : loadingResult // ignore: cast_nullable_to_non_nullable
              as DelayedResult<void>,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DelayedResultCopyWith<void, $Res> get loadingResult {
    return $DelayedResultCopyWith<void, $Res>(_self.loadingResult, (value) {
      return _then(_self.copyWith(loadingResult: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CartState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_CartState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CartState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<String, CartListItem> items, double totalPrice,
            int totalItems, DelayedResult<void> loadingResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(_that.items, _that.totalPrice, _that.totalItems,
            _that.loadingResult);
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
  TResult when<TResult extends Object?>(
    TResult Function(Map<String, CartListItem> items, double totalPrice,
            int totalItems, DelayedResult<void> loadingResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState():
        return $default(_that.items, _that.totalPrice, _that.totalItems,
            _that.loadingResult);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<String, CartListItem> items, double totalPrice,
            int totalItems, DelayedResult<void> loadingResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CartState() when $default != null:
        return $default(_that.items, _that.totalPrice, _that.totalItems,
            _that.loadingResult);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CartState implements CartState {
  const _CartState(
      {Map<String, CartListItem> items = const {},
      this.totalPrice = 0.0,
      this.totalItems = 0,
      this.loadingResult = const DelayedResult.idle()})
      : _items = items;

  final Map<String, CartListItem> _items;
  @override
  @JsonKey()
  Map<String, CartListItem> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final int totalItems;
  @override
  @JsonKey()
  final DelayedResult<void> loadingResult;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartStateCopyWith<_CartState> get copyWith =>
      __$CartStateCopyWithImpl<_CartState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.loadingResult, loadingResult) ||
                other.loadingResult == loadingResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalPrice,
      totalItems,
      loadingResult);

  @override
  String toString() {
    return 'CartState(items: $items, totalPrice: $totalPrice, totalItems: $totalItems, loadingResult: $loadingResult)';
  }
}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(
          _CartState value, $Res Function(_CartState) _then) =
      __$CartStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, CartListItem> items,
      double totalPrice,
      int totalItems,
      DelayedResult<void> loadingResult});

  @override
  $DelayedResultCopyWith<void, $Res> get loadingResult;
}

/// @nodoc
class __$CartStateCopyWithImpl<$Res> implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? totalPrice = null,
    Object? totalItems = null,
    Object? loadingResult = null,
  }) {
    return _then(_CartState(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, CartListItem>,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      loadingResult: null == loadingResult
          ? _self.loadingResult
          : loadingResult // ignore: cast_nullable_to_non_nullable
              as DelayedResult<void>,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DelayedResultCopyWith<void, $Res> get loadingResult {
    return $DelayedResultCopyWith<void, $Res>(_self.loadingResult, (value) {
      return _then(_self.copyWith(loadingResult: value));
    });
  }
}

// dart format on
