void main() async {
  final sw = Stopwatch()..start();

  final searchResult = await search('candy');

  final mapResult = await map(searchResult);

  print(mapResult);

  final searchResult2 = await search('chocolate');

  final mapResult2 = await map(searchResult2);

  print(mapResult2);

  final searchResult3 = await search('ice cream');

  final mapResult3 = await map(searchResult3);

  print(mapResult3);

  sw.stop();

  print('Total time: ${sw.elapsedMilliseconds}ms');
}

Future<String> search(String query) async {
  await Future.delayed(Duration(seconds: 3));

  return 'Search results for $query';
}

Future<String> map(String query) async {
  await Future.delayed(Duration(seconds: 3));

  return 'Mapped: $query';
}
