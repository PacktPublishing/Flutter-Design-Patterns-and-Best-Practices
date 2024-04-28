abstract class CheckoutRepository {
  Future<List<String>> getPaymentMethods();
  Future<void> checkout(String paymentMethodId);
}
