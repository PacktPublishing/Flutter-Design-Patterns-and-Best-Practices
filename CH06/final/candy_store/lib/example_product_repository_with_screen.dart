import 'package:candy_store/simple_product_repository.dart';
import 'package:flutter/material.dart';

final SimpleProductRepository productRepository = SimpleProductRepository();

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products = productRepository.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candy Store'),
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_products[index]),
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
