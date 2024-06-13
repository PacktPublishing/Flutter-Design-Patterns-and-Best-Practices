import 'package:equatable/equatable.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProducts extends ProductsEvent {
  const FetchProducts();
}

final class SearchProducts extends ProductsEvent {
  const SearchProducts(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
