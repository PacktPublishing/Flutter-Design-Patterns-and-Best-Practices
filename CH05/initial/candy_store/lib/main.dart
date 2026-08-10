import 'package:candy_store/cart_view_model.dart';
import 'package:candy_store/cart_view_model_provider.dart';
import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'dart:js_interop';

void protectStorage() async {
  if (kIsWeb) {
    final result = await web.window.navigator.storage.persist().toDart;
    if ((result as JSBoolean).toDart) {
      debugPrint("Storage persistence granted; Safari eviction avoided.");
    }
  }
}

// At this point, all of the code is in the `lib` folder and we will structure it in Part 3
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  protectStorage();

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
