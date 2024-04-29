import 'package:candy_store/product/domain/model/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();
}
