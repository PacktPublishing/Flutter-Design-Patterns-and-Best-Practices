import 'package:candy_store/cart_list_item.dart';

class CartInfo {
  Map<String, CartListItem> items;
  double totalPrice;
  int totalItems;

  CartInfo({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
  });

  CartInfo copyWith({
    Map<String, CartListItem>? items,
    double? totalPrice,
    int? totalItems,
  }) {
    return CartInfo(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}
