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

// Represents the current state of the app navigation
class DessertRoutePath {
  final int? id;
  final bool isUnknown;

  DessertRoutePath.home()
      : id = null,
        isUnknown = false;

  DessertRoutePath.details(this.id) : isUnknown = false;

  DessertRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null && !isUnknown;
  bool get isDetailsPage => id != null;
}

class CandyShopApp extends StatefulWidget {
  const CandyShopApp({super.key});

  @override
  State<StatefulWidget> createState() => _CandyShopAppState();
}

class _CandyShopAppState extends State<CandyShopApp> {
  final DessertRouterDelegate _routerDelegate = DessertRouterDelegate();
  final DessertRouteInformationParser _routeInformationParser = DessertRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Candy Shop',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

// Parses the route information into a user-defined data type.
class DessertRouteInformationParser extends RouteInformationParser<DessertRoutePath> {
  @override
  Future<DessertRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return DessertRoutePath.home();
    }

    // Handle '/dessert/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'dessert') return DessertRoutePath.unknown();
      var id = int.tryParse(uri.pathSegments[1]);
      if (id == null) return DessertRoutePath.unknown();
      return DessertRoutePath.details(id);
    }

    // Handle unknown routes
    return DessertRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(DessertRoutePath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(uri: Uri.parse('/dessert/${configuration.id}'));
    }
    return null;
  }
}

// Router delegate that listens for changes in the app state and updates the navigation stack.
class DessertRouterDelegate extends RouterDelegate<DessertRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<DessertRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Dessert? _selectedDessert;
  bool show404 = false;

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

  DessertRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  DessertRoutePath get currentConfiguration {
    if (show404) {
      return DessertRoutePath.unknown();
    }
    return _selectedDessert == null
        ? DessertRoutePath.home()
        : DessertRoutePath.details(desserts.indexOf(_selectedDessert!));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('DessertsListPage'),
          child: DessertsListScreen(
            desserts: desserts,
            onTapped: _handleDessertTapped,
          ),
        ),
        if (show404)
          const MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedDessert != null)
          DessertDetailsPage(dessert: _selectedDessert!)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedDessert to null
        _selectedDessert = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(DessertRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedDessert = null;
      show404 = true;
      return;
    }

    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! >= desserts.length) {
        show404 = true;
        return;
      }

      _selectedDessert = desserts[configuration.id!];
    } else {
      _selectedDessert = null;
    }

    show404 = false;
  }

  void _handleDessertTapped(Dessert dessert) {
    _selectedDessert = dessert;
    notifyListeners();
  }
}

class DessertDetailsPage extends Page {
  final Dessert dessert;

  DessertDetailsPage({
    required this.dessert,
  }) : super(key: ValueKey(dessert));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return DessertDetailsScreen(dessert: dessert);
      },
    );
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

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('404 NOT FOUND', style: Theme.of(context).textTheme.titleLarge),
            Text('The desert you are looking for is eaten or it was never here! 👀',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
