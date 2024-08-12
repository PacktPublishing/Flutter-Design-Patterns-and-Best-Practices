import "package:candy_store/cart/cart.dart";
import "package:candy_store/faves/data/api/local_storage_api.g.dart";
import "package:candy_store/faves/data/repository/local_faves_repository.dart";
import "package:candy_store/faves/domain/repository/faves_repository.dart";
import "package:candy_store/main_page.dart";
import "package:candy_store/product/product.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

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
        RepositoryProvider<FavesRepository>(
          create: (_) => LocalFavesRepository(
            api: LocalStorageApi(),
          ),
        ),
      ],
      child: MaterialApp(
        // On web the "fave" icon is hidden due to banner, this is done for convenience
        debugShowCheckedModeBanner: false,
        title: "Candy shop",
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: MainPage.withBloc(),
      ),
    ),
  );
}
