import 'dart:async';
import 'package:candy_store/cart/domain/model/cart_info.dart';
import 'package:candy_store/cart/domain/model/cart_list_item.dart';
import 'package:candy_store/cart/domain/repository/cart_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

class FakeCartRepository implements CartRepository {
  final _cartInfoController = StreamController<CartInfo>.broadcast();
  final Map<String, CartListItem> _items = {};
  double _totalPrice = 0;

  @override
  Stream<CartInfo> get cartInfoStream => _cartInfoController.stream;

  @override
  Future<CartInfo> get cartInfoFuture async {
    final cartInfo = CartInfo(
      items: Map.from(_items),
      totalPrice: _totalPrice,
      totalItems: _items.length,
    );
    print('FakeCartRepository.cartInfoFuture: $cartInfo');
    return cartInfo;
  }

  @override
  Future<void> addToCart(ProductListItem item) async {
    if (_items.containsKey(item.id)) {
      final currentItem = _items[item.id]!;
      _items[item.id] = CartListItem(
        product: currentItem.product,
        quantity: currentItem.quantity + 1,
      );
    } else {
      _items[item.id] = CartListItem(product: item, quantity: 1);
    }
    _totalPrice += item.price;
    _cartInfoController.add(await cartInfoFuture);
    print('FakeCartRepository.addToCart: Added ${item.name}, total items: ${_items.length}, total price: $_totalPrice');
  }

  @override
  Future<void> removeFromCart(CartListItem item) async {
    if (_items.containsKey(item.product.id)) {
      final currentItem = _items[item.product.id]!;
      _totalPrice -= item.product.price;
      if (currentItem.quantity > 1) {
        _items[item.product.id] = CartListItem(
          product: currentItem.product,
          quantity: currentItem.quantity - 1,
        );
      } else {
        _items.remove(item.product.id);
      }
      _cartInfoController.add(await cartInfoFuture);
      print(
          'FakeCartRepository.removeFromCart: Removed ${item.product.name}, total items: ${_items.length}, total price: $_totalPrice');
    }
  }

  void dispose() {
    _cartInfoController.close();
  }
}
