import 'package:candy_store/faves/data/api/local_storage_api.g.dart';
import 'package:candy_store/faves/domain/repository/faves_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/domain/repository/products_data.dart';

// TODO: Wrap MissingPluginException && PlatformException
class LocalFavesRepository implements FavesRepository {
  final LocalStorageApi _api;

  const LocalFavesRepository({
    required LocalStorageApi api,
  }) : _api = api;

  @override
  Future<void> addFave(ProductListItem item) => _api.addFave(item.id);

  @override
  Future<List<ProductListItem>> getFaves() async {
    final faves = (await _api.getFaves())
        .where((fave) => fave != null)
        .map((fave) => fave!.id)
        .toList();
    return productItems.where((item) => faves.contains(item.id)).toList();
  }

  @override
  Future<bool> isFave(String id) async => _api.isFave(id);

  @override
  Future<void> removeFave(String id) => _api.removeFave(id);
}
