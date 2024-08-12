import 'package:candy_store/cart/cart.dart';
import 'package:candy_store/faves/presentation/view/faves_page.dart';
import 'package:candy_store/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  static Widget withBloc() {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(
        cartRepository: context.read(),
      )..add(const Load()),
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
        ProductsPage(
          onFavesTap: _openFaves,
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: GestureDetector(
            onTap: _openCart,
            child: CartButton(
              count: totalItemsCount,
            ),
          ),
        ),
      ],
    );
  }

  void _openCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<CartBloc>(),
          child: const CartPage(),
        ),
      ),
    );
  }

  void _openFaves() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<CartBloc>(),
          child: FavesPage.withBloc(),
        ),
      ),
    );
  }
}
