import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/presentation/bloc/product_details_bloc.dart';
import 'package:candy_store/product/presentation/bloc/product_details_event.dart';
import 'package:candy_store/product/presentation/bloc/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.onAddToCart});

  final Function(ProductListItem item) onAddToCart;

  static Widget withBloc(
    ProductListItem item,
    Function(ProductListItem item) onAddToCart,
  ) =>
      BlocProvider(
        create: (context) => ProductDetailsBloc(
          item: item,
          favesRepository: context.read(),
        )..add(const LoadProductDetails()),
        child: ProductDetailsPage(onAddToCart: onAddToCart),
      );

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final ProductDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        final product = state.item;
        return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
            actions: [
              IconButton(
                onPressed: _toggleFavourite,
                icon: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ],
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Hero(
                        tag: product.id,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width * 0.7,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                      child: Text(
                        '${product.price}€',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 80),
                      child: Text(
                        product.description,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                  child: ElevatedButton(
                    onPressed: () => widget.onAddToCart(product),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleFavourite() => _bloc.add(const ToggleFavorite());
}
