import 'package:candy_store/common/model/delayed_result.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';
import 'package:candy_store/product/presentation/bloc/products_bloc_event.dart';
import 'package:candy_store/product/presentation/bloc/products_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;

  ProductsBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductsState()) {
    on<FetchProducts>(_onFetchProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      final products = await _productRepository.fetchProducts();
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
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  Future<void> _onSearchProducts(
      SearchProducts event,
      Emitter<ProductsState> emit,
      ) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      final products = await _productRepository.searchProducts(event.query);
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
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }
}
