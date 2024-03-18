import 'package:flutter/material.dart';

void main() {
  runApp(const CandyShopApp());
}

class Dessert {
  final String name;
  final String description;
  final String imageUrl;
  Dessert(this.name, this.description, this.imageUrl);
}

class CandyShopApp extends StatefulWidget {
  const CandyShopApp({super.key});

  @override
  State<StatefulWidget> createState() => _CandyShopAppState();
}

class _CandyShopAppState extends State<CandyShopApp> {
  Dessert? _selectedDessert;

  List<Dessert> desserts = [
    Dessert(
      'Cupcake',
      'A delicious cupcake with a variety of flavors and toppings',
      'resources/images/cupcake.webp',
    ),
    Dessert(
      'Donut',
      'A soft and sweet donut, glazed or filled with your favorite flavors',
      'resources/images/donut.webp',
    ),
    Dessert(
      'Eclair',
      'A long pastry filled with cream and topped with chocolate icing',
      'resources/images/eclair.webp',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candy Shop',
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('DessertsPage'),
            child: DessertsListScreen(
              desserts: desserts,
              onTapped: _handleDessertTapped,
            ),
          ),
          if (_selectedDessert != null)
            MaterialPage(
              key: ValueKey(_selectedDessert),
              child: DessertDetailsScreen(
                dessert: _selectedDessert!,
              ),
            )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }

  void _handleDessertTapped(Dessert dessert) {
    setState(() {
      _selectedDessert = dessert;
    });
  }
}

class DessertsListScreen extends StatelessWidget {
  final List<Dessert> desserts;
  final ValueChanged<Dessert> onTapped;

  const DessertsListScreen({
    super.key,
    required this.desserts,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Desserts'),
      ),
      body: ListView(
        children: [
          for (var dessert in desserts)
            ListTile(
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.asset(dessert.imageUrl),
                ),
              ),
              title: Text(dessert.name),
              subtitle: Text(dessert.description),
              onTap: () => onTapped(dessert),
            )
        ],
      ),
    );
  }
}

class DessertDetailsScreen extends StatelessWidget {
  final Dessert dessert;

  const DessertDetailsScreen({
    super.key,
    required this.dessert,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for ${dessert.name}'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(dessert.imageUrl),
                ),
              ),
              Text(dessert.name, style: Theme.of(context).textTheme.titleLarge),
              Text(dessert.description, style: Theme.of(context).textTheme.titleMedium),
            ],
          ],
        ),
      ),
    );
  }
}
