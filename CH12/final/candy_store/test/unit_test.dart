import 'package:candy_store/cart/domain/model/cart_list_item.dart';
import 'package:candy_store/cart/presentation/bloc/cart_bloc.dart';
import 'package:candy_store/cart/presentation/bloc/cart_event.dart';
import 'package:candy_store/cart/presentation/bloc/cart_state.dart';
import 'package:candy_store/common/model/delayed_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'fake_cart_repository.dart';
import 'test_data.dart';

void main() {
  group('CartBloc Unit Tests', () {
    test('Initial state is correct', () {
      final fakeCartRepository = FakeCartRepository();
      final cartBloc = CartBloc(cartRepository: fakeCartRepository);

      expect(
        cartBloc.state,
        const CartState(
          items: {},
          totalPrice: 0,
          totalItems: 0,
          loadingResult: DelayedResult.idle(),
        ),
      );
    });

    test('Remove item from cart', () async {
      final fakeCartRepository = FakeCartRepository();
      final cartBloc = CartBloc(cartRepository: fakeCartRepository);
      final product = TestData.testProductListItem;
      final cartItem = CartListItem(product: product, quantity: 1);

      // Pre-populate the cart with an item
      await fakeCartRepository.addToCart(product);

      // Ensure the initial state reflects the added item
      cartBloc.add(const Load());
      await Future.delayed(const Duration(milliseconds: 200));

      // Listen to state changes
      final states = <CartState>[];
      final subscription = cartBloc.stream.listen(states.add);

      // Remove item from cart
      cartBloc.add(RemoveItem(cartItem));

      // Allow time for the event to be processed
      await Future.delayed(const Duration(milliseconds: 500));

      await subscription.cancel();

      // Verify state changes
      expect(states.length, greaterThanOrEqualTo(3)); // Should have at least 3 states
      expect(states[0].loadingResult.isInProgress, isTrue);
      expect(states[1].loadingResult.isInProgress, isFalse);
      expect(states[2].items.length, equals(0));
      expect(states[2].totalPrice, equals(0));
    });
  });
}
