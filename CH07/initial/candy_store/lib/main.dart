import 'package:candy_store/api_service.dart';
import 'package:candy_store/cart_view_model.dart';
import 'package:candy_store/cart_view_model_provider.dart';
import 'package:candy_store/hive_service.dart';
import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';

final hiveService = HiveService();
final apiService = ApiService();

// At this point, all of the code is in the `lib` folder and we will structure it in Part 3
Future<void> main() async {
  await hiveService.initializeHive();
  runApp(
    CartViewModelProvider(
      cartViewModel: CartViewModel(),
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
