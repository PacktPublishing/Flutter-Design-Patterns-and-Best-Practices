import 'package:candy_store/cart_cubit.dart';
import 'package:candy_store/cart_list_item_view.dart';
import 'package:candy_store/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();

  static Widget withBloc() {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: const CartPage(),
    );
  }
}

class _CartPageState extends State<CartPage> {
  late final CartCubit _cartCubit;

  @override
  void initState() {
    super.initState();
    _cartCubit = context.read<CartCubit>();
    _cartCubit.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state.error != null) {
            _cartCubit.clearError();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to perform this action'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items.values.toList()[index];
                    return CartListItemView(item: item);
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (state.isProcessing)
                        const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      if (!state.isProcessing)
                        Text(
                          '${state.totalPrice} €',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
