import 'package:candy_store/cart/cart.dart';
import 'package:candy_store/main_page.dart';
import 'package:candy_store/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
