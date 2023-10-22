import 'api_service.dart';
import 'product.dart';
import 'product_repository.dart';

class ProductApiDataSource extends IProductRepository {
  ProductApiDataSource(this._apiService);

  final ApiService _apiService;

  @override
  Future<List<Product>> getProducts() async {
    return _apiService.fetchProducts();
  }
}
