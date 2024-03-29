import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            const Expanded(child: Text('First text')),
            Expanded(
              child: Container(
                color: Colors.red,
                width: 1000000,
                height: 100,
              ),
            ),
            const Expanded(child: Text('Second text'))
          ],
        ),
      ),
    ),
  );
}
