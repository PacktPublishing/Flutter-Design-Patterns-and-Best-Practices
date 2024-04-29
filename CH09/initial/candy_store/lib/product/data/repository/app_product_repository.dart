import 'package:candy_store/product/data/repository/local_product_repository.dart';
import 'package:candy_store/product/data/repository/network_product_repository.dart';
import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';

class AppProductRepository implements ProductRepository {
  AppProductRepository({
    required NetworkProductRepository remoteDataSource,
    required LocalProductRepository localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final NetworkProductRepository _remoteDataSource;
  final LocalProductRepository _localDataSource;

  @override
  Future<List<Product>> fetchProducts() async {
    // Retrieve candies from local data source
    final localProducts = await _localDataSource.fetchProducts();

    // Check if local data source has data
    if (localProducts.isNotEmpty) {
      return localProducts;
    } else {
      // If local data source is empty, fetch from API and cache it locally
      final apiProducts = await _remoteDataSource.fetchProducts();
      await _localDataSource.cacheProducts(apiProducts);
      return apiProducts;
    }
  }
}
