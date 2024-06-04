import 'package:equatable/equatable.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProducts extends ProductsEvent {
  const FetchProducts();
}
