import 'package:candy_store/cart_event.dart';
import 'package:candy_store/cart_info.dart';
import 'package:candy_store/cart_model.dart';
import 'package:candy_store/cart_state.dart';
import 'package:candy_store/delayed_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartModel _cartModel = CartModel();

  CartBloc()
      : super(
          const CartState(
            items: {},
            totalPrice: 0,
            totalItems: 0,
            loadingResult: DelayedResult.idle(),
          ),
        ) {
    on<Load>(_onLoad);
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ClearError>(_onClearError);
  }

  Future<void> _onLoad(Load event, Emitter emit) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      final cartInfo = await _cartModel.cartInfoFuture;
      // TODO: Should actually copy the Map and not just the reference
      emit(
        state.copyWith(
          items: cartInfo.items,
          totalPrice: cartInfo.totalPrice,
          totalItems: cartInfo.totalItems,
        ),
      );
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
      await emit.onEach(
        _cartModel.cartInfoStream,
        onData: (CartInfo cartInfo) {
          emit(
            state.copyWith(
              items: cartInfo.items,
              totalPrice: cartInfo.totalPrice,
              totalItems: cartInfo.totalItems,
            ),
          );
        },
        onError: (Object error, StackTrace stackTrace) {
          if (kDebugMode) {
            print('Error: $error');
          }
        },
      );
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  Future<void> _onAddItem(AddItem event, Emitter emit) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      await _cartModel.addToCart(event.item);
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  Future<void> _onRemoveItem(RemoveItem event, Emitter emit) async {
    try {
      emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
      await _cartModel.removeFromCart(event.item);
      emit(state.copyWith(loadingResult: const DelayedResult.idle()));
    } on Exception catch (ex) {
      emit(state.copyWith(loadingResult: DelayedResult.fromError(ex)));
    }
  }

  void _onClearError(ClearError event, Emitter emit) {
    emit(state.copyWith(loadingResult: const DelayedResult.idle()));
  }

/*  @override
  Future<void> close() async {
    _cartModel.dispose();
    super.close();
  }*/
}
