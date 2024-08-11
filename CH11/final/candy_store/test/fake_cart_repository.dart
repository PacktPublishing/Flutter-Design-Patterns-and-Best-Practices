import 'dart:async';
import 'package:candy_store/cart/domain/model/cart_info.dart';
import 'package:candy_store/cart/domain/model/cart_list_item.dart';
import 'package:candy_store/cart/domain/repository/cart_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

class FakeCartRepository implements CartRepository {
  final _cartInfoController = StreamController<CartInfo>.broadcast();
  final List<CartListItem> _items = [];
  double _totalPrice = 0;

  @override
  Stream<CartInfo> get cartInfoStream => _cartInfoController.stream;

  @override
  Future<CartInfo> get cartInfoFuture async {
    final itemsMap = {for (var item in _items) item.product.id: item};

    return CartInfo(
      items: itemsMap,
      totalPrice: _totalPrice,
      totalItems: _items.length,
    );
  }

  @override
  Future<void> addToCart(ProductListItem item) async {
    final cartItem = CartListItem(
      product: item,
      quantity: 1,
    );
    _items.add(cartItem);
    _totalPrice += item.price;
    _cartInfoController.add(await cartInfoFuture);
  }

  @override
  Future<void> removeFromCart(CartListItem item) async {
    _items.removeWhere((cartItem) => cartItem.product.id == item.product.id);
    _totalPrice -= item.product.price;
    _cartInfoController.add(await cartInfoFuture);
  }

  void dispose() {
    _cartInfoController.close();
  }
}
