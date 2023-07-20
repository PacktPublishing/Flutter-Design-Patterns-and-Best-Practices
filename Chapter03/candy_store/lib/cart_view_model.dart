import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_model.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:flutter/foundation.dart';

class CartViewModel extends ChangeNotifier {
  final CartModel _cartModel = CartModel();

  CartViewModel() {
    _cartModel.cartInfoStream.listen((cartInfo) {
      _items.clear();
      _totalItems = cartInfo.totalItems;
      _totalPrice = cartInfo.totalPrice;
      cartInfo.items.forEach((key, value) {
        _items[key] = value;
      });
      notifyListeners();
    });
  }

  final Map<String, CartListItem> _items = {};
  double _totalPrice = 0;
  int _totalItems = 0;

  List<CartListItem> get items => _items.values.toList();

  double get totalPrice => _totalPrice;

  int get totalItems => _totalItems;

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
