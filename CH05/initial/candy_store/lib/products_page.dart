import 'package:candy_store/product_list_item.dart';
import 'package:candy_store/product_list_item_view.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<ProductListItem> items = [
    ProductListItem(
      id: '1',
      name: 'Cupcake',
      description: 'A delicious cupcake with a variety of flavors and toppings',
      price: 3,
      imageUrl: 'resources/images/cupcake.webp',
    ),
    ProductListItem(
      id: '2',
      name: 'Donut',
      description:
          'A soft and sweet donut, glazed or filled with your favorite flavors',
      price: 2,
      imageUrl: 'resources/images/donut.webp',
    ),
    ProductListItem(
      id: '3',
      name: 'Eclair',
      description:
          'A long pastry filled with cream and topped with chocolate icing',
      price: 4,
      imageUrl: 'resources/images/eclair.webp',
    ),
    ProductListItem(
      id: '4',
      name: 'Froyo',
      description:
          'A creamy and refreshing frozen yogurt with various toppings',
      price: 5,
      imageUrl: 'resources/images/froyo.webp',
    ),
    ProductListItem(
      id: '5',
      name: 'Gingerbread',
      description:
          'A warm and spicy gingerbread cookie, perfect for the holidays',
      price: 2,
      imageUrl: 'resources/images/gingerbread.webp',
    ),
    ProductListItem(
      id: '6',
      name: 'Honeycomb',
      description:
          'A sweet and crunchy honeycomb candy made from caramelized sugar',
      price: 3,
      imageUrl: 'resources/images/honeycomb.webp',
    ),
    ProductListItem(
      id: '7',
      name: 'Ice Cream Sandwich',
      description:
          'A classic dessert made with ice cream sandwiched between two cookies or wafers',
      price: 4,
      imageUrl: 'resources/images/sandwich.webp',
    ),
    ProductListItem(
      id: '8',
      name: 'Jelly Bean',
      description:
          'Colorful and chewy jelly beans in a variety of fruity flavors',
      price: 2,
      imageUrl: 'resources/images/jellybean.webp',
    ),
    ProductListItem(
      id: '9',
      name: 'KitKat',
      description:
          'A chocolate-covered wafer bar with a satisfying crunch in every bite',
      price: 2,
      imageUrl: 'resources/images/kitkat.webp',
    ),
    ProductListItem(
      id: '10',
      name: 'Key Lime Pie',
      description:
          'A tangy and sweet pie made with key lime juice, egg yolks, and sweetened condensed milk',
      price: 5,
      imageUrl: 'resources/images/keylimepie.webp',
    ),
    ProductListItem(
      id: '11',
      name: 'Lollipop',
      description:
          'A sweet and hard candy on a stick, available in many flavors and shapes',
      price: 1,
      imageUrl: 'resources/images/lollipop.webp',
    ),
    ProductListItem(
      id: '12',
      name: 'Marshmallow',
      description:
          'A soft and fluffy marshmallow, perfect for roasting or adding to your favorite treats',
      price: 2,
      imageUrl: 'resources/images/marshmallow.webp',
    ),
    ProductListItem(
      id: '13',
      name: 'Nougat',
      description:
          'A chewy and nutty nougat candy made with sugar, honey, and nuts',
      price: 3,
      imageUrl: 'resources/images/nougat.webp',
    ),
    ProductListItem(
      id: '14',
      name: 'Oreo',
      description:
          'A classic sandwich cookie with a sweet cream filling between two chocolate wafers',
      price: 2,
      imageUrl: 'resources/images/oreo.webp',
    ),
    ProductListItem(
      id: '15',
      name: 'Pie',
      description:
          'A classic dessert made with a buttery crust and various fruit fillings',
      price: 6,
      imageUrl: 'resources/images/pie.webp',
    ),
    ProductListItem(
      id: '16',
      name: 'Quince Tart',
      description:
          'A delightful tart filled with quince, a sweet and tangy fruit',
      price: 6,
      imageUrl: 'resources/images/quincetart.webp',
    ),
    ProductListItem(
      id: '17',
      name: 'Red Velvet Cake',
      description:
          'A rich and moist cake with a distinctive red hue, layered with cream cheese frosting',
      price: 7,
      imageUrl: 'resources/images/redvelvetcake.webp',
    ),
    ProductListItem(
      id: '18',
      name: 'Snow Cone',
      description:
          'A refreshing and icy treat made from crushed ice and flavored syrup',
      price: 3,
      imageUrl: 'resources/images/snowcone.webp',
    ),
    ProductListItem(
      id: '19',
      name: 'Tiramisu',
      description:
          'An elegant Italian dessert made with layers of coffee-soaked ladyfingers and a rich mascarpone cheese cream',
      price: 7,
      imageUrl: 'resources/images/tiramisu.webp',
    ),
    ProductListItem(
      id: '20',
      name: 'Upside Down Cake',
      description:
          'A delicious cake baked with a layer of fruit and caramel on the bottom, then inverted to serve',
      price: 6,
      imageUrl: 'resources/images/upsidedowncake.webp',
    ),
    ProductListItem(
      id: '21',
      name: 'Vanilla Ice Cream',
      description:
          'A classic and creamy vanilla ice cream, enjoyed by itself or with your favorite toppings',
      price: 4,
      imageUrl: 'resources/images/vanillaicecream.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ProductListItemView(item: item);
        },
      ),
    );
  }
}
