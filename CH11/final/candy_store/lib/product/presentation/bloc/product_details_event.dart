import 'package:equatable/equatable.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDetails extends ProductDetailsEvent {
  const LoadProductDetails();
}

class ToggleFavorite extends ProductDetailsEvent {
  const ToggleFavorite();
}
