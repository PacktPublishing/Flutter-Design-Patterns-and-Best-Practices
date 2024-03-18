import 'package:flutter/material.dart';

void main() {
  runApp(const CandyShopApp());
}

class CandyShopApp extends StatefulWidget {
  const CandyShopApp({super.key});

  @override
  State<StatefulWidget> createState() => _CandyShopAppState();
}

class _CandyShopAppState extends State<CandyShopApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candy Shop',
      home: Navigator(
        pages: const [
          MaterialPage(
            key: ValueKey('DessertsPage'),
            child: Scaffold(
              body: Center(
                child: Text('Welcome to Candy Shop!'),
              ),
            ),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
