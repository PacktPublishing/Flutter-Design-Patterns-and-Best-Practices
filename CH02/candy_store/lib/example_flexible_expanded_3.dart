import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
