import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Flow(
          delegate: CircleLayoutDelegate(),
          children: [
            Container(width: 50.0, height: 50.0, color: Colors.red),
            Container(width: 50.0, height: 50.0, color: Colors.green),
            Container(width: 50.0, height: 50.0, color: Colors.blue),
            Container(width: 50.0, height: 50.0, color: Colors.yellow),
            Container(width: 50.0, height: 50.0, color: Colors.purple),
            Container(width: 50.0, height: 50.0, color: Colors.pink),
            Container(width: 50.0, height: 50.0, color: Colors.orange),
          ],
        ),
      ),
    ),
  );
}

class CircleLayoutDelegate extends FlowDelegate {
  final double radius = 100;

  CircleLayoutDelegate();

  @override
  void paintChildren(FlowPaintingContext context) {
    final n = context.childCount;
    final double angleIncrement = 2 * pi / n;

    // Center of the layout
    final double centerX = context.size.width / 2;
    final double centerY = context.size.height / 2;

    for (int i = 0; i < n; i++) {
      final double angle = angleIncrement * i;
      // Calculate x and y positions based on angle
      final double x =
          centerX + radius * cos(angle) - context.getChildSize(i)!.width / 2;
      final double y =
          centerY + radius * sin(angle) - context.getChildSize(i)!.height / 2;
      // Positioning the child
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;

  @override
  Size getSize(BoxConstraints constraints) {
    // Adjusting the overall size to ensure children are not cut off
    final double totalDiameter = (radius + maxChildSize / 2) * 2;
    return Size(totalDiameter, totalDiameter);
  }

  double get maxChildSize => 50.0;
}
