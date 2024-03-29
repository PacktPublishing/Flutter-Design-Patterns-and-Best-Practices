import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: ResponsiveLayoutExample(),
      ),
    ),
  );
}

class ResponsiveLayoutExample extends StatelessWidget {
  const ResponsiveLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GridView.count(
      crossAxisCount: _getCrossAxisCount(screenSize.width),
      children: List.generate(
        12,
        (index) => Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.green,
          child: Text('Item ${index + 1}'),
        ),
      ),
    );
  }

  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth >= 1200) {
      return 4;
    } else if (screenWidth >= 800) {
      return 3;
    } else if (screenWidth >= 600) {
      return 2;
    } else {
      return 1;
    }
  }
}
