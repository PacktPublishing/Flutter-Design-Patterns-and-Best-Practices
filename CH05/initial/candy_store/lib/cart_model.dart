import 'dart:async';

import 'package:candy_store/cart_info.dart';
import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/product_list_item.dart';

class CartModel {
  CartInfo _cartInfo = CartInfo(
    items: {},
    totalPrice: 0,
    totalItems: 0,
  );

  CartInfo get cartInfo => _cartInfo;

  final StreamController<CartInfo> _cartInfoController =
      StreamController<CartInfo>();

  Stream<CartInfo> get cartInfoStream => _cartInfoController.stream;

  Future<CartInfo> get cartInfoFuture async => _cartInfo;

  void addToCart(ProductListItem item) {
    CartListItem? existingItem = _cartInfo.items[item.id];
    if (existingItem != null) {
      existingItem = CartListItem(
        product: existingItem.product,
        quantity: existingItem.quantity + 1,
      );
      _cartInfo.items[item.id] = existingItem;
    } else {
      final cartItem = CartListItem(
        product: item,
        quantity: 1,
      );
      _cartInfo.items[item.id] = cartItem;
    }
    _cartInfo.totalItems++;
    _cartInfo.totalPrice += item.price;

    _cartInfoController.add(_cartInfo);
    //notifyListeners();
  }

  void removeFromCart(CartListItem item) {
    CartListItem? existingItem = _cartInfo.items[item.product.id];
    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem = CartListItem(
          product: existingItem.product,
          quantity: existingItem.quantity - 1,
        );
        _cartInfo.items[item.product.id] = existingItem;
      } else {
        _cartInfo.items.remove(item.product.id);
      }
    }
    _cartInfo.totalItems--;
    _cartInfo.totalPrice -= item.product.price;

    _cartInfoController.add(_cartInfo);
    //notifyListeners();
  }

  void dispose() {
    _cartInfoController.close();
  }
}
