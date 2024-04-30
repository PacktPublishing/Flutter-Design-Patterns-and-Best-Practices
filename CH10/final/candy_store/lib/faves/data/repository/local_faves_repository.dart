import 'package:candy_store/faves/domain/repository/faves_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/domain/repository/products_data.dart';
import 'package:flutter/services.dart';

// TODO: Wrap MissingPluginException && PlatformException
class LocalFavesRepository implements FavesRepository {
  static const _platform = MethodChannel('com.example.candy_store/faves');

  @override
  Future<void> addFave(ProductListItem item) async {
    _platform.invokeMethod(
      'addFave',
      {'id': item.id},
    );
  }

  @override
  Future<List<ProductListItem>> getFaves() async {
    final faves = await _platform.invokeListMethod<String>('getFaves') ?? [];
    return productItems.where((item) => faves.contains(item.id)).toList();
  }

  @override
  Future<bool> isFave(String id) async {
    final isFave = await _platform.invokeMethod<bool>(
      'isFave',
      {'id': id},
    );
    return isFave ?? false;
  }

  @override
  Future<void> removeFave(String id) async {
    _platform.invokeMethod(
      'removeFave',
      {'id': id},
    );
  }
}
