import 'package:candy_store/product/domain/model/product_list_item.dart';

class CartListItem {
  final ProductListItem product;
  final int quantity;

  CartListItem({
    required this.product,
    required this.quantity,
  });
}
