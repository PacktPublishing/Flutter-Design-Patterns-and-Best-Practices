import 'package:candy_store/cart_notifier.dart';
import 'package:candy_store/cart_notifier_provider.dart';
import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';

// At this point, all of the code is in the `lib` folder and we will sort it in Part 3
void main() {
  runApp(
    CartProvider(
      cartNotifier: CartNotifier(),
      child: MaterialApp(
        title: 'Candy shop',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: const MainPage(),
      ),
    ),
  );
}
