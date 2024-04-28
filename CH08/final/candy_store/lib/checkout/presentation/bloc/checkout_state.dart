import 'package:candy_store/common/model/delayed_result.dart';
import 'package:equatable/equatable.dart';

class CheckoutState extends Equatable {
  final List<String> paymentMethods;
  final DelayedResult<bool> checkoutResult;

  const CheckoutState({
    required this.paymentMethods,
    required this.checkoutResult,
  });

  CheckoutState copyWith({
    List<String>? paymentMethods,
    DelayedResult<bool>? checkoutResult,
  }) {
    return CheckoutState(
      paymentMethods: paymentMethods ?? this.paymentMethods,
      checkoutResult: checkoutResult ?? this.checkoutResult,
    );
  }

  @override
  List<Object?> get props => [
        paymentMethods,
        checkoutResult,
      ];
}
