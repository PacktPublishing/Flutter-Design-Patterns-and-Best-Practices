void main() async {
  print("Before");

  printWith1msDelay()
      .then(
    (_) => printWith1SecondDelay().catchError(
      (ex, st) {
        print("Handle error thrown by printWith1SecondDelay()");
      },
    ),
  )
      .catchError((ex, st) {
    print("Handle error thrown by printWith1msDelay()");
  });
}

Future<void> printWith1msDelay() async {
  await Future.delayed(const Duration(milliseconds: 1));
  print("Print with 1 ms delay");
}

Future<void> printWith1SecondDelay() async {
  await Future.delayed(const Duration(seconds: 1));
  print("Print with 1 second delay");
}
