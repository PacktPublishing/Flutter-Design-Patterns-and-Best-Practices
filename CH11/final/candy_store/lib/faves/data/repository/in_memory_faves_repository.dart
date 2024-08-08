import 'package:candy_store/faves/domain/repository/faves_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

class InMemoryFavesRepository implements FavesRepository {
  final List<ProductListItem> _faves = [];

  @override
  Future<void> addFave(ProductListItem item) async {
    _faves.add(item);
  }

  @override
  Future<List<ProductListItem>> getFaves() async {
    return _faves;
  }

  @override
  Future<void> removeFave(String id) async {
    _faves.removeWhere((element) => element.id == id);
  }

  @override
  Future<bool> isFave(String id) async {
    return _faves.any((element) => element.id == id);
  }
}
