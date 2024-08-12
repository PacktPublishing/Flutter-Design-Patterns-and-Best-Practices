import 'package:flutter/material.dart';

void main() {
  runApp(const ProgressWidget());
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 1000000; i++) {
      print('$i');
    }

    return const MaterialApp(
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
