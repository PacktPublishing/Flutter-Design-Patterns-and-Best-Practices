void main() async {
  final sw = Stopwatch()..start();

  final searchResultFuture = search('candy');

  final searchResultFuture2 = search('chocolate');

  final searchResultFuture3 = search('ice cream');

  final mapResultFuture = map(await searchResultFuture);

  final mapResultFuture2 = map(await searchResultFuture2);

  final mapResultFuture3 = map(await searchResultFuture3);

  final results = await Future.wait([
    mapResultFuture,
    mapResultFuture2,
    mapResultFuture3,
  ]);

  print(results);

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
