import 'package:candy_store/checkout/domain/repository/checkout_repository.dart';
import 'package:candy_store/checkout/presentation/bloc/checkout_state.dart';
import 'package:candy_store/common/model/delayed_result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepository _checkoutRepository;

  CheckoutCubit(this._checkoutRepository)
      : super(
    const CheckoutState(
      paymentMethods: [],
      checkoutResult: DelayedResult.none(),
      selectedPaymentMethod: 'none',
    ),
  );

  void loadPaymentMethods() async {
    final paymentMethods = await _checkoutRepository.getPaymentMethods();
    emit(state.copyWith(paymentMethods: paymentMethods));
  }

  void checkout(String paymentMethodId) async {
    emit(state.copyWith(checkoutResult: const DelayedResult.inProgress()));
    try {
      await _checkoutRepository.checkout(paymentMethodId);
      emit(state.copyWith(checkoutResult: const DelayedResult.fromValue(true)));
    } on Exception catch (ex, st) {
      if (kDebugMode) {
        print('Failed to checkout: $ex, $st');
      }
      emit(state.copyWith(checkoutResult: DelayedResult.fromError(ex)));
    }
  }

  void selectPaymentMethod(String paymentMethod) {
    emit(state.copyWith(selectedPaymentMethod: paymentMethod));
  }
}
