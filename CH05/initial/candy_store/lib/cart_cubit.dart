import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_model.dart';
import 'package:candy_store/cart_state.dart';
import 'package:candy_store/core/architecture.dart';
import 'package:candy_store/delayed_result.dart';
import 'package:candy_store/product_list_item.dart';

class CartCubit extends WatchStreamCubit<CartState> {
  final CartModel _cartModel = CartModel();

  CartCubit()
      : super(const CartState(
          items: {},
          totalPrice: 0,
          totalItems: 0,
          loadingResult: DelayedResult.idle(),
        )) {
    _loadAndWatch();
  }

  Future<void> _loadAndWatch() async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      final cartInfo = await _cartModel.cartInfoFuture;
      emit(
        state.copyWith(
          items: cartInfo.items,
          totalPrice: cartInfo.totalPrice,
          totalItems: cartInfo.totalItems,
          loadingResult: const DelayedResult.idle(),
        ),
      );
      
      watchStream(_cartModel.cartInfoStream.map((cartInfo) {
        return state.copyWith(
          items: cartInfo.items,
          totalPrice: cartInfo.totalPrice,
          totalItems: cartInfo.totalItems,
        );
      }));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  Future<void> addToCart(ProductListItem item) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      await RepositoryException.wrapWrite(() => _cartModel.addToCart(item));
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  Future<void> removeFromCart(CartListItem item) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      await RepositoryException.wrapWrite(() => _cartModel.removeFromCart(item));
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  void clearError() {
    emit(state.copyWith(loadingResult: const DelayedResult.idle()));
  }
}
