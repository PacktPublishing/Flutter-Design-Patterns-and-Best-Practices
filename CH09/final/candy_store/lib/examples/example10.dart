void main() async {
  print("Before");
  try {
    await printWith1msDelay();
    await printWith1SecondDelay();
  } on ImportantException catch (ex, st) {
    print("An important exception was thrown");
  } on UnimportantException catch (ex, st) {
    print("An unimportant exception was thrown");
  }
}

Future<void> printWith1msDelay() async {
  await Future.delayed(const Duration(milliseconds: 1));
  print("Print with 1 ms delay");
  throw UnimportantException();
}

Future<void> printWith1SecondDelay() async {
  await Future.delayed(const Duration(seconds: 1));
  print("Print with 1 second delay");
  throw ImportantException();
}

class ImportantException implements Exception {}
class UnimportantException implements Exception {}
