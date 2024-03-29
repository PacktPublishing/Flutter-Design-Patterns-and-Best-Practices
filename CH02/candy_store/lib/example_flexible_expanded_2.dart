import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(height: 50.0, color: Colors.red),
            ),
            Container(width: 50.0, height: 50.0, color: Colors.green),
            Flexible(
              flex: 1,
              child: Container(height: 50.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    ),
  );
}
