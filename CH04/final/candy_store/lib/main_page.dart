import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_view_model_provider.dart';
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
    final cartViewModel = CartViewModelProvider.of(context);

    return ListenableBuilder(
      listenable: cartViewModel,
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
                  count: cartViewModel.state.totalItems,
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
        builder: (context) => CartPage.withBloc(),
      ),
    );
  }
}
