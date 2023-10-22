import 'package:candy_store/product_repository/product.dart';
import 'package:candy_store/product_repository/product_repository.dart';
import 'package:hive/hive.dart';

class ProductHiveDataSource extends IProductRepository {
  ProductHiveDataSource(this._productBox);

  final Box<Product> _productBox;

  @override
  Future<List<Product>> getProducts() async {
    return _productBox.values.toList();
  }

  Future<void> cacheProducts(List<Product> products) async {
    await _productBox.addAll(products);
  }

  Future<void> clearCache() async {
    await _productBox.clear();
  }
}
