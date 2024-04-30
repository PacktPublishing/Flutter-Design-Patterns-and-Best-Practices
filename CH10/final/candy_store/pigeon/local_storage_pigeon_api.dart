import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/faves/data/api/local_storage_api.g.dart',
    kotlinOut:
    'android/app/src/main/kotlin/com/example/candy_store/LocalStorageApi.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.candy_store'),
    swiftOut: 'ios/Runner/LocalStorageApi.g.swift',
    dartPackageName: 'candy_store',
  ),
)
@HostApi()
abstract class LocalStorageApi {
  void addFave(String id);

  void removeFave(String id);

  bool isFave(String id);

  List<FaveProduct> getFaves();
}

class FaveProduct {
  final String id;

  FaveProduct(this.id);
}
