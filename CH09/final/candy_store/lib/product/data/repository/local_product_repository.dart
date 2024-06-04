import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';
import 'package:hive/hive.dart';

class LocalProductRepository implements ProductRepository {
  LocalProductRepository(this._productBox);

  final Box<Product> _productBox;

  @override
  Future<List<Product>> fetchProducts() async {
    return _productBox.values.toList();
  }

  Future<void> cacheProducts(List<Product> products) async {
    await _productBox.addAll(products);
  }

  Future<void> clearCache() async {
    await _productBox.clear();
  }

  @override
  Future<List<Product>> searchProducts(String query) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
