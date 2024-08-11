import 'package:candy_store/cart/presentation/bloc/cart_bloc.dart';
import 'package:candy_store/cart/presentation/bloc/cart_event.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/presentation/view/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListItemView extends StatelessWidget {
  final ProductListItem item;
  final bool showPlaceholderForImage;

  const ProductListItemView({
    super.key,
    required this.item,
    this.showPlaceholderForImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage.withBloc(
              item,
              (item) => _onAddToCart(context, item),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 72,
                height: 72,
                child: showPlaceholderForImage ? const Placeholder() : Image.asset(item.imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        item.description,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${item.price}€',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _onAddToCart(context, item),
                  child: Icon(
                    Icons.add,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onAddToCart(BuildContext context, ProductListItem item) {
    context.read<CartBloc>().add(AddItem(item));
  }
}
