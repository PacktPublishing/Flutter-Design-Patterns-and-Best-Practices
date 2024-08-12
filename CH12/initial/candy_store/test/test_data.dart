import 'package:candy_store/product/domain/model/product.dart';
import 'package:candy_store/product/domain/model/product_list_item.dart';

class TestData {
  static const List<Product> testProducts = [
    Product(
      id: '2',
      name: 'Test Donut',
      description: 'A soft and sweet test donut, glazed or filled with your favorite flavors',
      price: 4,
      imageUrl: 'resources/images/donut.webp',
      sku: '231fd',
      stock: 5,
    ),
  ];

  static final testProductListItem = ProductListItem(
    id: '1',
    name: 'Test Bean',
    description: 'Colorful and chewy test beans in a variety of fruity flavors',
    price: 2,
    imageUrl: 'resources/images/jellybean.webp',
  );
}
