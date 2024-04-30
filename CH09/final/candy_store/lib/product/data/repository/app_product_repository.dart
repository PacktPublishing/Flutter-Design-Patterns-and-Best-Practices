import 'package:candy_store/product/data/repository/local_product_repository.dart';
import 'package:candy_store/product/data/repository/network_product_repository.dart';
import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/repository/fake_search_data.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';
import 'package:flutter/foundation.dart';

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

  @override
  Future<List<Product>> searchProducts(String query) async {
    final allProducts = fakeSearchData;
    if (query.isEmpty) {
      return allProducts;
    }
    final results = await compute(_search, query);
    return results;
  }

  static List<Product> _search(String query) {
    final products = fakeSearchData;
    final filtered = products.where((product) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }
      final nameDistance = _levenshteinDistance(
        product.name.toLowerCase(),
        query.toLowerCase(),
      );
      final descriptionDistance = _levenshteinDistance(
        product.description.toLowerCase(),
        query.toLowerCase(),
      );
      return nameDistance <= 3 || descriptionDistance <= 3;
    }).toList();
    return filtered;
  }

  static int _levenshteinDistance(String a, String b) {
    if (a == b) {
      return 0;
    }
    if (a.isEmpty) {
      return b.length;
    }
    if (b.isEmpty) {
      return a.length;
    }

    List<List<int>> matrix = List.generate(b.length + 1,
        (i) => List.generate(a.length + 1, (j) => j, growable: false),
        growable: false);

    for (int i = 1; i <= b.length; i++) {
      matrix[i][0] = i;
    }

    for (int i = 1; i <= b.length; i++) {
      for (int j = 1; j <= a.length; j++) {
        int substitutionCost = (a[j - 1] == b[i - 1]) ? 0 : 1;
        matrix[i][j] = _min(
          matrix[i - 1][j] + 1, // deletion
          matrix[i][j - 1] + 1, // insertion
          matrix[i - 1][j - 1] + substitutionCost, // substitution
        );
      }
    }

    return matrix[b.length][a.length];
  }

  static int _min(int a, int b, int c) {
    return (a < b) ? (a < c ? a : c) : (b < c ? b : c);
  }
}
