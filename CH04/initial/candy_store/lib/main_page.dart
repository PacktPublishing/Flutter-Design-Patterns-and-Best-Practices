import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_notifier_provider.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final cartNotifier = CartProvider.of(context);

    return ListenableBuilder(
      listenable: cartNotifier,
      builder: (context, _) {
        return Stack(
          children: [
            const ProductsPage(),
            Positioned(
              right: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: openCart,
                child: CartButton(
                  count: cartNotifier.totalItems,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }
}
