import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_cubit.dart';
import 'package:candy_store/cart_state.dart';
import 'package:candy_store/cart_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Stack(
          children: [
            const ProductsPage(),
            Positioned(
              right: 16,
              bottom: 16,
              child: GestureDetector(
                onTap: openCart,
                child: CartButton(
                  count: state.totalItems,
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
        builder: (context) => CartPage.withCubit(),
      ),
    );
  }
}
