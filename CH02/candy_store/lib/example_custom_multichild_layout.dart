import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: CustomMultiChildLayout(
          delegate: CustomGridLayoutDelegate(),
          children: const [
            GridItem(id: 0, color: Colors.red),
            GridItem(id: 1, color: Colors.green),
            GridItem(id: 2, color: Colors.blue),
            GridItem(id: 3, color: Colors.yellow),
          ],
        ),
      ),
    ),
  );
}

class GridItem extends StatelessWidget {
  final Color color;
  final int id;

  const GridItem({super.key, required this.color, required this.id});

  @override
  Widget build(BuildContext context) {
    return LayoutId(
      id: id,
      child: Container(
        color: color,
      ),
    );
  }
}

class CustomGridLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    int count = 4;

    final double itemWidth = size.width / 3;
    final double itemHeight = size.height / 3;

    for (int i = 0; i < count; i++) {
      layoutChild(i, BoxConstraints.loose(size));

      final double xPos = (i % 3) * itemWidth;
      final double yPos = (i ~/ 3) * itemHeight;

      positionChild(i, Offset(xPos, yPos));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
