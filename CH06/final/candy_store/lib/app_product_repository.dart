import 'package:candy_store/product.dart';
import 'package:candy_store/product_repository.dart';

class AppProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProduct() {
    // Fetch candies from the data source (e.g., local database or API)
    // Transform the raw data if necessary
    // Return the list of candies
    throw UnimplementedError();
  }

  @override
  Future<Product> fetchProductById(int id) {
    // Fetch a specific Product by ID
    // Transform the raw data if necessary
    // Return the Product object
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) {
    // Update product data in the data source
    throw UnimplementedError();
  }
}
