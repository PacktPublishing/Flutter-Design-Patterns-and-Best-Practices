import 'package:candy_store/common/model/delayed_result.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  final List<ProductListItem> items;
  final DelayedResult<void> loadingResult;

  const ProductsState({
    this.loadingResult = const DelayedResult.idle(),
    this.items = const [],
  });

  @override
  List<Object?> get props => [items, loadingResult];

  ProductsState copyWith({
    List<ProductListItem>? items,
    DelayedResult<void>? loadingResult,
  }) {
    return ProductsState(
      items: items ?? this.items,
      loadingResult: loadingResult ?? this.loadingResult,
    );
  }
}
