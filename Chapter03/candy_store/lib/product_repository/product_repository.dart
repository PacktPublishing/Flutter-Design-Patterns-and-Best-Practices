import 'product.dart';
import 'product_api_data_source.dart';
import 'product_hive_data_source.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepository extends IProductRepository {
  ProductRepository({
    required ProductApiDataSource remoteDataSource,
    required ProductHiveDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final ProductApiDataSource _remoteDataSource;
  final ProductHiveDataSource _localDataSource;

  @override
  Future<List<Product>> getProducts() async {
    // Retrieve candies from local data source
    final localProducts = await _localDataSource.getProducts();

    // Check if local data source has data
    if (localProducts.isNotEmpty) {
      return localProducts;
    } else {
      // If local data source is empty, fetch from API and cache it locally
      final apiProducts = await _remoteDataSource.getProducts();
      await _localDataSource.cacheProducts(apiProducts);
      return apiProducts;
    }
  }
}
