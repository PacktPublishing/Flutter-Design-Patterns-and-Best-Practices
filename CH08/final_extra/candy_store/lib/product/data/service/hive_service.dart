import 'package:candy_store/product/domain/model/product.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductAdapter());
    await Hive.openBox<Product>('products');
  }

  Box<Product> getProductBox() {
    return Hive.box<Product>('products');
  }
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final typeId = 0;

  @override
  Product read(BinaryReader reader) {
    return Product(
      id: reader.read(),
      name: reader.read(),
      description: reader.read(),
      price: reader.read(),
      imageUrl: reader.read(),
      sku: reader.read(),
      stock: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.description);
    writer.write(obj.price);
    writer.write(obj.imageUrl);
    writer.write(obj.sku);
    writer.write(obj.stock);
  }
}
