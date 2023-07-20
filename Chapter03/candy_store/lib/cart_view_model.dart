import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_model.dart';
import 'package:candy_store/cart_state.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:flutter/foundation.dart';

class CartViewModel extends ChangeNotifier {
  // TODO: Inject this in the DI chapter
  final CartModel _cartModel = CartModel();

  CartViewModel() {
    _cartModel.cartInfoStream.listen((cartInfo) {
      // TODO: Should actually copy the Map and not just the reference
      _state = _state.copyWith(
        items: cartInfo.items,
        totalPrice: cartInfo.totalPrice,
        totalItems: cartInfo.totalItems,
      );
      notifyListeners();
    });
  }

  CartState _state = CartState(
    items: {},
    totalPrice: 0,
    totalItems: 0,
  );

  CartState get state => _state;

  void addToCart(ProductListItem item) {
    _cartModel.addToCart(item);
  }

  void removeFromCart(CartListItem item) {
    _cartModel.removeFromCart(item);
  }

  @override
  void dispose() {
    super.dispose();
    _cartModel.dispose();
  }
}
