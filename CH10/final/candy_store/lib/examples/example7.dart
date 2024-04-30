void main() async {
  print("Before");
  await printWithZeroDelay();
  print("After");
}

Future<void> printWithZeroDelay() async {
  await Future.delayed(Duration.zero);
  print("Print with zero delay");
}
