import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:equatable/equatable.dart';

class ProductDetailsState extends Equatable {
  final ProductListItem item;
  final bool isFavorite;

  const ProductDetailsState({
    required this.item,
    required this.isFavorite,
  });

  ProductDetailsState copyWith({
    ProductListItem? item,
    bool? isFavorite,
  }) {
    return ProductDetailsState(
      item: item ?? this.item,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [item, isFavorite];
}
