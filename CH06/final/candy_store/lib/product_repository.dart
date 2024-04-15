import 'package:candy_store/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProduct();

  Future<Product> fetchProductById(int id);

  Future<void> updateProduct(Product product);
}
