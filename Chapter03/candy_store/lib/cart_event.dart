import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:equatable/equatable.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class Load extends CartEvent {
  const Load();
}

final class AddItem extends CartEvent {
  final ProductListItem item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

final class RemoveItem extends CartEvent {
  final CartListItem item;

  const RemoveItem(this.item);

  @override
  List<Object?> get props => [item];
}

final class ClearError extends CartEvent {
  const ClearError();
}
