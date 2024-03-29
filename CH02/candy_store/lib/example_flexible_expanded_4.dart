import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            const Text('First text'),
            Container(
              color: Colors.red,
              width: 1000000,
              height: 100,
            ),
            const Text('Second text')
          ],
        ),
      ),
    ),
  );
}
