import 'package:candy_store/api_service.dart';
import 'package:candy_store/app_product_repository.dart';
import 'package:candy_store/cart_repository.dart';
import 'package:candy_store/hive_service.dart';
import 'package:candy_store/in_memory_cart_repository.dart';
import 'package:candy_store/local_product_repository.dart';
import 'package:candy_store/main_page.dart';
import 'package:candy_store/network_product_repository.dart';
import 'package:candy_store/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// At this point, all of the code is in the `lib` folder and we will structure it in Part 3
Future<void> main() async {
  final hiveService = HiveService();
  final apiService = ApiService();
  await hiveService.initializeHive();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ProductRepository>(
          create: (_) => AppProductRepository(
            remoteDataSource: NetworkProductRepository(apiService),
            localDataSource: LocalProductRepository(
              hiveService.getProductBox(),
            ),
          ),
        ),
        RepositoryProvider<CartRepository>(
          create: (_) => InMemoryCartRepository(),
        ),
      ],
      child: MaterialApp(
        title: 'Candy shop',
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: MainPage.withBloc(),
      ),
    ),
  );
}

