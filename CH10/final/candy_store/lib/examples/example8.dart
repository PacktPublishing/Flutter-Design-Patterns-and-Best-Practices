void main() {
  print("Before");
  printWithZeroDelay()
      .then((_) => print("After"));
}

Future<void> printWithZeroDelay() async {
  await Future.delayed(Duration.zero);
  print("Print with zero delay");
}
