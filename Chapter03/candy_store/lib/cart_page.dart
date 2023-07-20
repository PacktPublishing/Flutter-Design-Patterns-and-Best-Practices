import 'package:candy_store/cart_list_item_view.dart';
import 'package:candy_store/cart_view_model_provider.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartViewModel = CartViewModelProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListenableBuilder(
        listenable: cartViewModel,
        builder: (context, _) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: cartViewModel.state.items.length,
                  itemBuilder: (_, index) {
                    return CartListItemView(
                      item: cartViewModel.state.items.values.toList()[index],
                    );
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
                      Text(
                        '${cartViewModel.state.totalPrice} €',
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
