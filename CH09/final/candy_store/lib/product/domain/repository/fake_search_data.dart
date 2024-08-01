import 'package:candy_store/product/domain/model/product.dart';

final products = [
  const Product(
    id: '1',
    name: 'Cupcake',
    description: 'A delicious cupcake with a variety of flavors and toppings',
    price: 3,
    imageUrl: 'resources/images/cupcake.webp',
    sku: '5t2g',
    stock: 10,
  ),
  const Product(
      id: '2',
      name: 'Donut',
      description:
          'A soft and sweet donut, glazed or filled with your favorite flavors',
      price: 2,
      imageUrl: 'resources/images/donut.webp',
      sku: '163g',
      stock: 5),
  const Product(
      id: '3',
      name: 'Eclair',
      description:
          'A long pastry filled with cream and topped with chocolate icing',
      price: 4,
      imageUrl: 'resources/images/eclair.webp',
      sku: '5a3g',
      stock: 6),
  const Product(
    id: '4',
    name: 'Froyo',
    description: 'A creamy and refreshing frozen yogurt with various toppings',
    price: 5,
    imageUrl: 'resources/images/froyo.webp',
    sku: '5t2h',
    stock: 10,
  ),
  const Product(
    id: '5',
    name: 'Gingerbread',
    description:
        'A warm and spicy gingerbread cookie, perfect for the holidays',
    price: 2,
    imageUrl: 'resources/images/gingerbread.webp',
    sku: '5t2i',
    stock: 12,
  ),
  const Product(
    id: '6',
    name: 'Honeycomb',
    description:
        'A sweet and crunchy honeycomb candy made from caramelized sugar',
    price: 3,
    imageUrl: 'resources/images/honeycomb.webp',
    sku: '5t2j',
    stock: 10,
  ),
  const Product(
    id: '7',
    name: 'Ice Cream Sandwich',
    description:
        'A classic dessert made with ice cream sandwiched between two cookies or wafers',
    price: 4,
    imageUrl: 'resources/images/sandwich.webp',
    sku: '5t2k',
    stock: 20,
  ),
  const Product(
    id: '8',
    name: 'Jelly Bean',
    description:
        'Colorful and chewy jelly beans in a variety of fruity flavors',
    price: 2,
    imageUrl: 'resources/images/jellybean.webp',
    sku: '5t2l',
    stock: 10,
  ),
  const Product(
    id: '9',
    name: 'KitKat',
    description:
        'A chocolate-covered wafer bar with a satisfying crunch in every bite',
    price: 2,
    imageUrl: 'resources/images/kitkat.webp',
    sku: '5t2m',
    stock: 10,
  ),
  const Product(
    id: '10',
    name: 'Key Lime Pie',
    description:
        'A tangy and sweet pie made with key lime juice, egg yolks, and sweetened condensed milk',
    price: 5,
    imageUrl: 'resources/images/keylimepie.webp',
    sku: '5t2n',
    stock: 10,
  ),
  const Product(
    id: '11',
    name: 'Lollipop',
    description:
        'A sweet and hard candy on a stick, available in many flavors and shapes',
    price: 1,
    imageUrl: 'resources/images/lollipop.webp',
    sku: '5t2o',
    stock: 10,
  ),
  const Product(
    id: '12',
    name: 'Marshmallow',
    description:
        'A soft and fluffy marshmallow, perfect for roasting or adding to your favorite treats',
    price: 2,
    imageUrl: 'resources/images/marshmallow.webp',
    sku: '5t2p',
    stock: 10,
  ),
  const Product(
    id: '13',
    name: 'Nougat',
    description:
        'A chewy and nutty nougat candy made with sugar, honey, and nuts',
    price: 3,
    imageUrl: 'resources/images/nougat.webp',
    sku: '5t2q',
    stock: 10,
  ),
  const Product(
    id: '14',
    name: 'Oreo',
    description:
        'A classic sandwich cookie with a sweet cream filling between two chocolate wafers',
    price: 2,
    imageUrl: 'resources/images/oreo.webp',
    sku: '5t2r',
    stock: 10,
  ),
  const Product(
    id: '15',
    name: 'Pie',
    description:
        'A classic dessert made with a buttery crust and various fruit fillings',
    price: 6,
    imageUrl: 'resources/images/pie.webp',
    sku: '5t2s',
    stock: 10,
  ),
  const Product(
    id: '16',
    name: 'Quince Tart',
    description:
        'A delightful tart filled with quince, a sweet and tangy fruit',
    price: 6,
    imageUrl: 'resources/images/quincetart.webp',
    sku: '5t2t',
    stock: 10,
  ),
  const Product(
    id: '17',
    name: 'Red Velvet Cake',
    description:
        'A rich and moist cake with a distinctive red hue, layered with cream cheese frosting',
    price: 7,
    imageUrl: 'resources/images/redvelvetcake.webp',
    sku: '5t2u',
    stock: 10,
  ),
  const Product(
    id: '18',
    name: 'Snow Cone',
    description:
        'A refreshing and icy treat made from crushed ice and flavored syrup',
    price: 3,
    imageUrl: 'resources/images/snowcone.webp',
    sku: '5t2v',
    stock: 10,
  ),
  const Product(
    id: '19',
    name: 'Tiramisu',
    description:
        'An elegant Italian dessert made with layers of coffee-soaked ladyfingers and a rich mascarpone cheese cream',
    price: 7,
    imageUrl: 'resources/images/tiramisu.webp',
    sku: '5t2w',
    stock: 10,
  ),
  const Product(
    id: '20',
    name: 'Upside Down Cake',
    description:
        'A delicious cake baked with a layer of fruit and caramel on the bottom, then inverted to serve',
    price: 6,
    imageUrl: 'resources/images/upsidedowncake.webp',
    sku: '5t2x',
    stock: 10,
  ),
  const Product(
    id: '21',
    name: 'Vanilla Ice Cream',
    description:
        'A classic and creamy vanilla ice cream, enjoyed by itself or with your favorite toppings',
    price: 4,
    imageUrl: 'resources/images/vanillaicecream.webp',
    sku: '5t2y',
    stock: 10,
  ),
];

final List<Product> fakeSearchData = [
  for (var i = 0; i < 21 * 100000; i += 1) products[i % products.length],
];

