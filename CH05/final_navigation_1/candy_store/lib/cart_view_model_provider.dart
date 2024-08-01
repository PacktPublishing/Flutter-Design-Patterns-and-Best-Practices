import 'package:candy_store/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartViewModelProvider extends InheritedWidget {
  final CartViewModel cartViewModel;

  const CartViewModelProvider({
    super.key,
    required this.cartViewModel,
    required Widget child,
  }) : super(child: child);

  static CartViewModel of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartViewModelProvider>();

    if (provider == null) {
      throw 'No CartProvider found in context';
    }

    return provider.cartViewModel;
  }

  static CartViewModel read(BuildContext context) {
    final provider = context.getInheritedWidgetOfExactType<CartViewModelProvider>();

    if (provider == null) {
      throw Exception('No CartViewModelProvider found in context');
    }

    return (provider).cartViewModel;
  }

  @override
  bool updateShouldNotify(CartViewModelProvider oldWidget) {
    return cartViewModel != oldWidget.cartViewModel;
  }
}
