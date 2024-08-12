import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:equatable/equatable.dart';

class FavesState extends Equatable {
  final List<ProductListItem> items;

  const FavesState({required this.items});

  FavesState copyWith({List<ProductListItem>? items}) =>
      FavesState(items: items ?? this.items);

  @override
  List<Object?> get props => [items];
}
