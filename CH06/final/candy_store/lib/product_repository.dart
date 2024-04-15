import 'package:candy_store/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();
}
