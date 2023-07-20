import 'package:candy_store/cart_list_item.dart';

class CartState {
  final Map<String, CartListItem> items;
  final double totalPrice;
  final int totalItems;
  final bool isProcessing;
  final Exception? error;

  CartState({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
    this.isProcessing = false,
    this.error,
  });

  CartState copyWith({
    Map<String, CartListItem>? items,
    double? totalPrice,
    int? totalItems,
    bool? isProcessing,
    Exception? error,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error,
    );
  }
}
