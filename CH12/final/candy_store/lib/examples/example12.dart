void main() async {
  final sw = Stopwatch()..start();
  await doSomeImportantWork();
  await doSomeImportantWork();
  await doSomeImportantWork();
  sw.stop();
  print('Total time: ${sw.elapsedMilliseconds}ms');
}

Future<void> doSomeImportantWork() async {
  await Future.delayed(Duration(seconds: 3));
  print('Important work done');
}
