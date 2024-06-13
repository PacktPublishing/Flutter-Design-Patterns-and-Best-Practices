import 'package:candy_store/product/domain/model/product_list_item.dart';

abstract class FavesRepository {
  Future<List<ProductListItem>> getFaves();

  Future<void> addFave(ProductListItem item);

  Future<void> removeFave(String id);

  Future<bool> isFave(String id);
}
