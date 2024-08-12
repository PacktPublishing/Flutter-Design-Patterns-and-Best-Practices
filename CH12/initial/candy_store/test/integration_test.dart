import 'package:candy_store/cart/domain/repository/cart_repository.dart';
import 'package:candy_store/cart/presentation/bloc/cart_bloc.dart';
import 'package:candy_store/cart/presentation/view/cart_page.dart';
import 'package:candy_store/cart/presentation/widget/cart_button.dart';
import 'package:candy_store/main_page.dart';
import 'package:candy_store/product/domain/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fake_cart_repository.dart';
import 'fake_product_repository.dart';
import 'test_data.dart';

void main() {
  testWidgets('should display an item in the cart', (WidgetTester tester) async {
    final fakeCartRepository = FakeCartRepository();
    final cartBloc = CartBloc(cartRepository: fakeCartRepository);

    // Adding items to the fake repository
    final product = TestData.testProductListItem;
    await fakeCartRepository.addToCart(product);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CartBloc>(
          create: (_) => cartBloc,
          child: const CartPage(),
        ),
      ),
    );

    // Ensure the widget tree is built
    await tester.pump();

    expect(find.text('Test Bean'), findsOneWidget);
    expect(find.text('Total:'), findsOneWidget);
    expect(find.text('2.0 €'), findsOneWidget);
  });

  testWidgets('View the main page as expected for 1 product.', (WidgetTester tester) async {
    final fakeCartRepository = FakeCartRepository();
    final fakeProductRepository = FakeProductRepository();
    final cartBloc = CartBloc(cartRepository: fakeCartRepository);

    await tester.pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CartRepository>(
            create: (_) => fakeCartRepository,
          ),
          RepositoryProvider<ProductRepository>(
            create: (_) => fakeProductRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (_) => cartBloc,
            ),
          ],
          child: MaterialApp(
            home: MainPage.withBloc(),
          ),
        ),
      ),
    );

    // Ensure the widget tree is built
    await tester.pumpAndSettle();

    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(MainPage), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNWidgets(1));
  });

  testWidgets('Add one product to cart in main page.', (WidgetTester tester) async {
    final fakeCartRepository = FakeCartRepository();
    final fakeProductRepository = FakeProductRepository();
    final cartBloc = CartBloc(cartRepository: fakeCartRepository);

    await tester.pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<CartRepository>(
            create: (_) => fakeCartRepository,
          ),
          RepositoryProvider<ProductRepository>(
            create: (_) => fakeProductRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (_) => cartBloc,
            ),
          ],
          child: MaterialApp(
            home: MainPage.withBloc(),
          ),
        ),
      ),
    );

    // Ensure the widget tree is built
    await tester.pumpAndSettle();

    // Verify the cart button displays the correct count
    expect(find.widgetWithText(CartButton, '0'), findsOneWidget);

    // Tap the add button on the product item
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify the cart button displays the correct count
    expect(find.widgetWithText(CartButton, '1'), findsOneWidget);
  });
}
