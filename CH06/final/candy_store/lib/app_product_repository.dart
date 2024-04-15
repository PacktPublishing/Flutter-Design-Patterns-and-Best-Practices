import 'package:candy_store/product.dart';
import 'package:candy_store/product_repository.dart';

class AppProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() {
    // Fetch candies from the data source (e.g., local database or API)
    // Transform the raw data if necessary
    // Return the list of candies
    throw UnimplementedError();
  }
}
