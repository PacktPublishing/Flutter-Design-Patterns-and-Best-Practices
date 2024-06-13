import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:equatable/equatable.dart';

sealed class FavesEvent extends Equatable {
  const FavesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFaves extends FavesEvent {}

class AddFave extends FavesEvent {
  final ProductListItem item;

  const AddFave(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveFave extends FavesEvent {
  final String id;

  const RemoveFave(this.id);

  @override
  List<Object?> get props => [id];
}
