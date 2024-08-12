void main() async {
  print("Before");

  printWithZeroDelay()
      .then(
    (_) => printWithOneSecondDelay().catchError(
      (ex, st) {
        print("Handle error thrown by printWithOneSecondDelay()");
      },
    ),
  )
      .catchError((ex, st) {
    print("Handle error thrown by printWithZeroDelay()");
  });
}

Future<void> printWithZeroDelay() async {
  await Future.delayed(Duration.zero);
  print("Print with zero delay");
}

Future<void> printWithOneSecondDelay() async {
  await Future.delayed(Duration(seconds: 1));
  print("Print with one second delay");
}
