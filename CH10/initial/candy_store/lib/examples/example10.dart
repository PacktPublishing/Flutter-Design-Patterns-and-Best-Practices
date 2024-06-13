void main() async {
  print("Before");
  try {
    await printWithZeroDelay();
    await printWithOneSecondDelay();
  } on ImportantException catch (ex, st) {
    print("An important exception was thrown");
  } on UnimportantException catch (ex, st) {
    print("An unimportant exception was thrown");
  }
}

Future<void> printWithZeroDelay() async {
  await Future.delayed(Duration.zero);
  throw UnimportantException();
}

Future<void> printWithOneSecondDelay() async {
  await Future.delayed(Duration(seconds: 1));
  print("Print with one second delay");
  throw ImportantException();
}

class ImportantException implements Exception {}
class UnimportantException implements Exception {}
