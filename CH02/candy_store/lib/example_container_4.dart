import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
            maxWidth: 200,
            maxHeight: 100,
          ),
          color: Colors.red,
          child: const Text('Hello World'),
        ),
      ),
    ),
  );
}
