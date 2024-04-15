import 'package:candy_store/cart_bloc.dart';
import 'package:candy_store/cart_event.dart';
import 'package:candy_store/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListItemView extends StatelessWidget {
  final CartListItem item;

  const CartListItemView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    final product = item.product;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(product.imageUrl),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      product.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: cartBloc.state.loadingResult.isInProgress
                              ? null
                              : () => cartBloc.add(RemoveItem(item)),
                          icon: Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          '${item.quantity}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: cartBloc.state.loadingResult.isInProgress
                              ? null
                              : () => cartBloc.add(AddItem(item.product)),
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${product.price * item.quantity}€',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
