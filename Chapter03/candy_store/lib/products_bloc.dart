import 'package:candy_store/product_list_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delayed_result.dart';
import 'main.dart';

import 'product_repository/product_api_data_source.dart';
import 'product_repository/product_hive_data_source.dart';
import 'product_repository/product_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  late final _productRepository = ProductRepository(
      remoteDataSource: ProductApiDataSource(apiService),
      localDataSource: ProductHiveDataSource(hiveService.getProductBox()));

  ProductsBloc() : super(const ProductsState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      final products = await _productRepository.getProducts();
      emit(
        state.copyWith(
          items: products
              .map(
                (p) => ProductListItem(
                  id: p.id,
                  name: p.name,
                  description: p.description,
                  price: p.price,
                  imageUrl: p.imageUrl,
                ),
              )
              .toList(),
        ),
      );
      emit(state.copyWith(loadingResult: const DelayedResult.none()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }
}

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

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class ProductsFetched extends ProductsEvent {
  const ProductsFetched();
}
