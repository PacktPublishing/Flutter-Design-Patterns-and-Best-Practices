import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text('1'),
              const Text('2'),
              const Text('3'),
              const Text('4'),
              Expanded(
                child: Container(
                  width: 200,
                  height: 1000,
                  color: Colors.red,
                ),
              ),
              const Text('5'),
              const Text('6'),
              const Text('7'),
              const Text('8'),
            ],
          ),
        ),
      ),
    ),
  );
}
