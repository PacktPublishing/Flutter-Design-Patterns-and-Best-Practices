import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.loose(
            const Size(200, 100),
          ),
          color: Colors.red,
          child: const Text('Hello Word'),
        ),
      ),
    ),
  );
}
