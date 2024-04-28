import 'package:candy_store/checkout/domain/repository/checkout_repository.dart';

class StubCheckoutRepository extends CheckoutRepository {
  @override
  Future<void> checkout(String paymentMethodId) async {
    print('Initiating checkout with payment method: $paymentMethodId');
  }

  @override
  Future<List<String>> getPaymentMethods() async {
    return ['Credit Card', 'PayPal', 'Cash on Delivery'];
  }
}
