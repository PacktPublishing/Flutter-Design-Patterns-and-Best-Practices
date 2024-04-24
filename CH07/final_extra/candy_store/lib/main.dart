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
import 'package:get_it/get_it.dart';

// At this point, all of the code is in the `lib` folder and we will structure it in Part 3
Future<void> main() async {
  await _setupDependencies();
  runApp(
    MaterialApp(
      title: 'Candy shop',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MainPage.withBloc(),
    ),
  );
}

Future<void> _setupDependencies() async {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<CartRepository>(() => InMemoryCartRepository());
  getIt.registerSingletonAsync<ProductRepository>(() async {
    final hiveService = HiveService();
    final apiService = ApiService();
    await hiveService.initializeHive();
    return AppProductRepository(
      remoteDataSource: NetworkProductRepository(apiService),
      localDataSource: LocalProductRepository(
        hiveService.getProductBox(),
      ),
    );
  });
  await getIt.allReady();
}
