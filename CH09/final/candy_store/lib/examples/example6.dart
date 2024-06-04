void main() {
  print("Before");
  printWith1msDelay();
  print("After");
}

Future<void> printWith1msDelay() async {
  await Future.delayed(const Duration(milliseconds: 1));
  print("Print with 1ms delay");
}
