void main() async {
  final data = await getImportantData();
  await printImportantData(data);
}

Future<String> getImportantData() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Important data';
}

Future<void> printImportantData(String data) async {
  await Future.delayed(Duration(seconds: 1));
  print(data);
}
