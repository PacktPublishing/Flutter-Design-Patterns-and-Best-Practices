import 'dart:convert';
import 'product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.example.com/candystore';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final productData = json.decode(response.body);
      return productData.map((json) => Product.fromJson(json)).toList();
    } else {
      return fakeApiResponse;
      //throw Exception('Failed to load candies');
    }
  }
}

final fakeApiResponse = [
  Product(
    id: '1',
    name: 'Cupcake',
    description: 'A delicious cupcake with a variety of flavors and toppings',
    price: 3,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2g',
    stock: 10,
  ),
  Product(
      id: '2',
      name: 'Donut',
      description:
          'A soft and sweet donut, glazed or filled with your favorite flavors',
      price: 2,
      imageUrl:
          'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
      sku: '163g',
      stock: 5),
  Product(
      id: '3',
      name: 'Eclair',
      description:
          'A long pastry filled with cream and topped with chocolate icing',
      price: 4,
      imageUrl:
          'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
      sku: '5a3g',
      stock: 6),
  Product(
    id: '4',
    name: 'Froyo',
    description: 'A creamy and refreshing frozen yogurt with various toppings',
    price: 5,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2h',
    stock: 10,
  ),
  Product(
    id: '5',
    name: 'Gingerbread',
    description:
        'A warm and spicy gingerbread cookie, perfect for the holidays',
    price: 2,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2i',
    stock: 12,
  ),
  Product(
    id: '6',
    name: 'Honeycomb',
    description:
        'A sweet and crunchy honeycomb candy made from caramelized sugar',
    price: 3,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2j',
    stock: 10,
  ),
  Product(
    id: '7',
    name: 'Ice Cream Sandwich',
    description:
        'A classic dessert made with ice cream sandwiched between two cookies or wafers',
    price: 4,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2k',
    stock: 20,
  ),
  Product(
    id: '8',
    name: 'Jelly Bean',
    description:
        'Colorful and chewy jelly beans in a variety of fruity flavors',
    price: 2,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2l',
    stock: 10,
  ),
  Product(
    id: '9',
    name: 'KitKat',
    description:
        'A chocolate-covered wafer bar with a satisfying crunch in every bite',
    price: 2,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2m',
    stock: 10,
  ),
  Product(
    id: '10',
    name: 'Key Lime Pie',
    description:
        'A tangy and sweet pie made with key lime juice, egg yolks, and sweetened condensed milk',
    price: 5,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2n',
    stock: 10,
  ),
  Product(
    id: '11',
    name: 'Lollipop',
    description:
        'A sweet and hard candy on a stick, available in many flavors and shapes',
    price: 1,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2o',
    stock: 10,
  ),
  Product(
    id: '12',
    name: 'Marshmallow',
    description:
        'A soft and fluffy marshmallow, perfect for roasting or adding to your favorite treats',
    price: 2,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2p',
    stock: 10,
  ),
  Product(
    id: '13',
    name: 'Nougat',
    description:
        'A chewy and nutty nougat candy made with sugar, honey, and nuts',
    price: 3,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2q',
    stock: 10,
  ),
  Product(
    id: '14',
    name: 'Oreo',
    description:
        'A classic sandwich cookie with a sweet cream filling between two chocolate wafers',
    price: 2,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2r',
    stock: 10,
  ),
  Product(
    id: '15',
    name: 'Pie',
    description:
        'A classic dessert made with a buttery crust and various fruit fillings',
    price: 6,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2s',
    stock: 10,
  ),
  Product(
    id: '16',
    name: 'Quince Tart',
    description:
        'A delightful tart filled with quince, a sweet and tangy fruit',
    price: 6,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2t',
    stock: 10,
  ),
  Product(
    id: '17',
    name: 'Red Velvet Cake',
    description:
        'A rich and moist cake with a distinctive red hue, layered with cream cheese frosting',
    price: 7,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2u',
    stock: 10,
  ),
  Product(
    id: '18',
    name: 'Snow Cone',
    description:
        'A refreshing and icy treat made from crushed ice and flavored syrup',
    price: 3,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2v',
    stock: 10,
  ),
  Product(
    id: '19',
    name: 'Tiramisu',
    description:
        'An elegant Italian dessert made with layers of coffee-soaked ladyfingers and a rich mascarpone cheese cream',
    price: 7,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2w',
    stock: 10,
  ),
  Product(
    id: '20',
    name: 'Upside Down Cake',
    description:
        'A delicious cake baked with a layer of fruit and caramel on the bottom, then inverted to serve',
    price: 6,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2x',
    stock: 10,
  ),
  Product(
    id: '21',
    name: 'Vanilla Ice Cream',
    description:
        'A classic and creamy vanilla ice cream, enjoyed by itself or with your favorite toppings',
    price: 4,
    imageUrl:
        'https://cdn-prod.medicalnewstoday.com/content/images/articles/317/317257/cupcakes.jpg',
    sku: '5t2y',
    stock: 10,
  ),
];
