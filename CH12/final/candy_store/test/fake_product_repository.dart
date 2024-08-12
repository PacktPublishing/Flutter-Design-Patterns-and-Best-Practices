import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';

import 'test_data.dart';

class FakeProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    return TestData.testProducts;
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    return TestData.testProducts.where((product) => product.name.contains(query)).toList();
  }
}
