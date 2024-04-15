import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 10,
            minHeight: 20,
            maxWidth: 10,
            maxHeight: 20,
          ),
          child: const ColoredBox(color: Colors.red),
        ),
      ),
    ),
  );
}
