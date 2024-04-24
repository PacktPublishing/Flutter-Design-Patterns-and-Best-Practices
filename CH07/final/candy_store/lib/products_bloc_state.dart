import 'package:candy_store/delayed_result.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  final List<ProductListItem> items;
  final DelayedResult<void> loadingResult;

  const ProductsState({
    this.loadingResult = const DelayedResult.none(),
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
