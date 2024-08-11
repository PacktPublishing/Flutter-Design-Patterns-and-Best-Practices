import 'package:candy_store/common/model/delayed_result.dart';
import 'package:equatable/equatable.dart';

class CheckoutState extends Equatable {
  final List<String> paymentMethods;
  final DelayedResult<bool> checkoutResult;
  final String selectedPaymentMethod;

  const CheckoutState({
    required this.paymentMethods,
    required this.checkoutResult,
    required this.selectedPaymentMethod,
  });

  CheckoutState copyWith({
    List<String>? paymentMethods,
    DelayedResult<bool>? checkoutResult,
    String? selectedPaymentMethod,
  }) {
    return CheckoutState(
      paymentMethods: paymentMethods ?? this.paymentMethods,
      checkoutResult: checkoutResult ?? this.checkoutResult,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }

  @override
  List<Object?> get props => [
    paymentMethods,
    checkoutResult,
    selectedPaymentMethod,
  ];
}
