import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Wrap(
          children: [
            const Text('First text'),
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            const Text('Second text'),
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            const Text('Third text'),
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    ),
  );
}
