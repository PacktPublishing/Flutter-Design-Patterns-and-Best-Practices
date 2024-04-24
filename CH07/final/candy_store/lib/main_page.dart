import 'package:candy_store/cart_bloc.dart';
import 'package:candy_store/cart_button.dart';
import 'package:candy_store/cart_event.dart';
import 'package:candy_store/cart_page.dart';
import 'package:candy_store/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  static Widget withBloc() {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc()..add(const Load()),
      child: const MainPage(),
    );
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final totalItemsCount =
        context.select<CartBloc, int>((bloc) => bloc.state.totalItems);

    return Stack(
      children: [
        const ProductsPage(),
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: openCart,
            child: CartButton(
              count: totalItemsCount,
            ),
          ),
        ),
      ],
    );
  }

  void openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<CartBloc>(),
          child: const CartPage(),
        ),
      ),
    );
  }
}
