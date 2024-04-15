import 'package:candy_store/api_service.dart';
import 'package:candy_store/product.dart';
import 'package:candy_store/product_repository.dart';

class NetworkProductRepository implements ProductRepository {
  NetworkProductRepository(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<Product>> fetchProducts() async {
    return _apiService.fetchProducts();
  }
}
