import 'package:candy_store/cart/domain/model/cart_info.dart';
import 'package:candy_store/cart/domain/model/cart_list_item.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

abstract interface class CartRepository {
  Stream<CartInfo> get cartInfoStream;

  Future<CartInfo> get cartInfoFuture;

  Future<void> addToCart(ProductListItem item);

  Future<void> removeFromCart(CartListItem item);
}
