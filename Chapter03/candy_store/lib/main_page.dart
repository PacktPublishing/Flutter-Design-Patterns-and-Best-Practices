import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<Map<String, CartListItem>> cartItemsMap = ValueNotifier({});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductsPage(
          onAddToCart: addToCart,
        ),
        ValueListenableBuilder(
          valueListenable: cartItemsMap,
          builder: (_, value, __) {
            final totalCount = value.values.fold<int>(
              0,
              (prev, curr) => prev + curr.quantity,
            );
            return Positioned(
              right: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: openCart,
                child: CartButton(
                  count: totalCount,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void addToCart(ProductListItem item) {
    final cartItems = {...cartItemsMap.value};
    CartListItem? existingItem = cartItems[item.id];
    if (existingItem != null) {
      existingItem = CartListItem(
        product: existingItem.product,
        quantity: existingItem.quantity + 1,
      );
      cartItems[item.id] = existingItem;
    } else {
      final cartItem = CartListItem(
        product: item,
        quantity: 1,
      );
      cartItems[item.id] = cartItem;
    }
    cartItemsMap.value = cartItems;
  }

  void removeFromCart(CartListItem item) {
    final cartItems = {...cartItemsMap.value};
    CartListItem? existingItem = cartItems[item.product.id];
    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        existingItem = CartListItem(
          product: existingItem.product,
          quantity: existingItem.quantity - 1,
        );
        cartItems[item.product.id] = existingItem;
      } else {
        cartItems.remove(item.product.id);
      }
    }
    cartItemsMap.value = cartItems;
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CartPage(
          items: cartItemsMap,
          onAddToCart: (item) {
            addToCart(item.product);
          },
          onRemoveFromCart: removeFromCart,
        ),
      ),
    );
  }
}
