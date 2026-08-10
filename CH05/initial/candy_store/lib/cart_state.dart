import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/delayed_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
sealed class CartState with _$CartState {
  const factory CartState({
    @Default({}) Map<String, CartListItem> items,
    @Default(0.0) double totalPrice,
    @Default(0) int totalItems,
    @Default(DelayedResult.idle()) DelayedResult<void> loadingResult,
  }) = _CartState;
}
