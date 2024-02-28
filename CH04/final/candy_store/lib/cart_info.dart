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
}
