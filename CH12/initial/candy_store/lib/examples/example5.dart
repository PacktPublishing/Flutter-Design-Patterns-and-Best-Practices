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

  Future<void> _block() async {
    for (int i = 0; i < 1000000; i++) {
      await Future.delayed(Duration.zero);
      print('$i');
    }
  }
}
