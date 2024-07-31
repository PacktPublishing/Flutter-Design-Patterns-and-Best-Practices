import 'package:candy_store/cart_bloc.dart';
import 'package:candy_store/cart_event.dart';
import 'package:candy_store/product_list_item_view.dart';
import 'package:candy_store/products_bloc.dart';
import 'package:candy_store/products_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductsBloc(
              productRepository: GetIt.I.get(),
            )..add(
                const FetchProducts(),
              ),
        child: _ProductsView());
  }
}

class _ProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = context.select((ProductsBloc bloc) => bloc.state.items);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ProductListItemView(
            item: item,
            onAddToCart: (item) {
              context.read<CartBloc>().add(AddItem(item));
            },
          );
        },
      ),
    );
  }
}
