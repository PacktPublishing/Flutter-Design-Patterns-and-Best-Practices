import 'package:candy_store/cart_list_item.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final Map<String, CartListItem> items;
  final double totalPrice;
  final int totalItems;
  final bool isProcessing;
  final Exception? error;

  const CartState({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
    this.isProcessing = false,
    this.error,
  });

  CartState copyWith({
    Map<String, CartListItem>? items,
    double? totalPrice,
    int? totalItems,
    bool? isProcessing,
    Exception? error,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        items,
        totalPrice,
        totalItems,
        isProcessing,
        error,
      ];
}
