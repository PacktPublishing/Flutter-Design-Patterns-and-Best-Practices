import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.tight(
            const Size(200, 100),
          ),
          color: Colors.red,
          child: const Text('Hello World'),
        ),
      ),
    ),
  );
}