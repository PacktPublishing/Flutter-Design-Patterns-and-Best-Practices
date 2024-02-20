import 'package:candy_store/main_page.dart';
import 'package:flutter/material.dart';

// At this point, all of the code is in the `lib` folder and we will structure it in Part 3
void main() {
  runApp(
    MaterialApp(
      title: 'Candy store',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: const MainPage(),
    ),
  );
}
