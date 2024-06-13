import 'package:flutter/material.dart';

void main() {
  runApp(const ProgressWidget());
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: _block,
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void _block() {
    for (int i = 0; i < 1000000; i++) {
      print('$i');
    }
  }
}
