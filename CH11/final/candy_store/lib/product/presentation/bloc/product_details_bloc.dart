import 'package:candy_store/faves/domain/repository/faves_repository.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';
import 'package:candy_store/product/presentation/bloc/product_details_event.dart';
import 'package:candy_store/product/presentation/bloc/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final FavesRepository favesRepository;

  ProductDetailsBloc({
    required ProductListItem item,
    required this.favesRepository,
  }) : super(
          ProductDetailsState(
            item: item,
            isFavorite: false,
          ),
        ) {
    on<LoadProductDetails>(_onLoadProductDetails);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetails event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final isFavorite = await favesRepository.isFave(state.item.id);
    emit(state.copyWith(isFavorite: isFavorite));
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductDetailsState> emit,
  ) async {
    final isFave = state.isFavorite;
    emit(state.copyWith(isFavorite: !isFave));
    if (isFave) {
      await favesRepository.removeFave(state.item.id);
    } else {
      await favesRepository.addFave(state.item);
    }
  }
}
