import 'dart:async';

import 'package:candy_store/cart/domain/model/cart_info.dart';
import 'package:candy_store/cart/domain/model/cart_list_item.dart';
import 'package:candy_store/cart/domain/repository/cart_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

class InMemoryCartRepository implements CartRepository {
  CartInfo _cartInfo = CartInfo(
    items: {},
    totalPrice: 0,
    totalItems: 0,
  );

  CartInfo get cartInfo => _cartInfo;

  final StreamController<CartInfo> _cartInfoController =
      StreamController<CartInfo>.broadcast();

  @override
  Stream<CartInfo> get cartInfoStream => _cartInfoController.stream;

  @override
  Future<CartInfo> get cartInfoFuture async => _cartInfo.copyWith(
        items: Map.unmodifiable(_cartInfo.items),
      );

  @override
  Future<void> addToCart(ProductListItem item) async {
    await Future.delayed(const Duration(seconds: 3));
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

    final cartInfo = _cartInfo.copyWith(
      items: Map.unmodifiable(_cartInfo.items),
    );

    _cartInfoController.add(cartInfo);
  }

  @override
  Future<void> removeFromCart(CartListItem item) async {
    await Future.delayed(const Duration(seconds: 3));
    // throw Exception('Could not remove item from cart')
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

    final cartInfo = _cartInfo.copyWith(
      items: Map.unmodifiable(_cartInfo.items),
    );

    _cartInfoController.add(cartInfo);
  }

  void dispose() {
    _cartInfoController.close();
  }
}
