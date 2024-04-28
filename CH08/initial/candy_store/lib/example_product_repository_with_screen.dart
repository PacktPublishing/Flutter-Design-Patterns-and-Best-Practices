import 'package:candy_store/simple_product_repository.dart';
import 'package:flutter/material.dart';

final SimpleProductRepository productRepository = SimpleProductRepository();

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = productRepository.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Candy Store'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: ProductListScreen(),
    ),
  );
}