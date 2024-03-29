import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return const DesktopLayout();
            } else {
              return const MobileLayout();
            }
          },
        ),
      ),
    ),
  );
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Align(
        alignment: Alignment.center,
        child: Text('Desktop Layout'),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Align(
        alignment: Alignment.center,
        child: Text('Mobile Layout'),
      ),
    );
  }
}
