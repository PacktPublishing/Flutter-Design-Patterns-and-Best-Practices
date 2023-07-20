import 'package:candy_store/cart_list_item.dart';

class CartState {
  final Map<String, CartListItem> items;
  final double totalPrice;
  final int totalItems;

  CartState({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
  });

  CartState copyWith({
    Map<String, CartListItem>? items,
    double? totalPrice,
    int? totalItems,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}
