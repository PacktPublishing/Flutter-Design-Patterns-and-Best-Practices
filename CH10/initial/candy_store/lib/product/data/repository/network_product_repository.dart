import 'package:candy_store/product/data/service/api_service.dart';
import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';

class NetworkProductRepository implements ProductRepository {
  NetworkProductRepository(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<Product>> fetchProducts() async {
    return _apiService.fetchProducts();
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
