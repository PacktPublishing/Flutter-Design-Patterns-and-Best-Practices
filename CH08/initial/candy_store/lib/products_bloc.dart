import 'package:candy_store/app_product_repository.dart';
import 'package:candy_store/delayed_result.dart';
import 'package:candy_store/local_product_repository.dart';
import 'package:candy_store/network_product_repository.dart';
import 'package:candy_store/product_list_item.dart';
import 'package:candy_store/products_bloc_event.dart';
import 'package:candy_store/products_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  late final _productRepository = AppProductRepository(
    remoteDataSource: NetworkProductRepository(apiService),
    localDataSource: LocalProductRepository(hiveService.getProductBox()),
  );

  ProductsBloc() : super(const ProductsState()) {
    on<FetchProducts>(_onFetchProducts);
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
}
