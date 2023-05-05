import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_notifier.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  CartNotifier cartNotifier = CartNotifier();

  @override
  void initState() {
    super.initState();

    cartNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    cartNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductsPage(
          cartNotifier: cartNotifier,
        ),
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
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartNotifier: cartNotifier,
        ),
      ),
    );
  }
}
