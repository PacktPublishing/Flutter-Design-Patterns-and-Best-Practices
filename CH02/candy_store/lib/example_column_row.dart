import 'package:flutter/material.dart';

void main() {
  const textStyle = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 2,
  );
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1', style: textStyle),
              Text('2', style: textStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('3', style: textStyle),
                  Text('4', style: textStyle),
                ],
              ),
              Text('5', style: textStyle),
            ],
          ),
        ),
      ),
    ),
  );
}
