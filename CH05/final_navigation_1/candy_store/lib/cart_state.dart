import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/delayed_result.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final Map<String, CartListItem> items;
  final double totalPrice;
  final int totalItems;
  final DelayedResult<void> loadingResult;

  const CartState({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
    required this.loadingResult,
  });

  CartState copyWith({
    Map<String, CartListItem>? items,
    double? totalPrice,
    int? totalItems,
    DelayedResult<void>? loadingResult,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      loadingResult: loadingResult ?? this.loadingResult,
    );
  }

  @override
  List<Object?> get props => [
        items,
        totalPrice,
        totalItems,
        loadingResult,
      ];
}
