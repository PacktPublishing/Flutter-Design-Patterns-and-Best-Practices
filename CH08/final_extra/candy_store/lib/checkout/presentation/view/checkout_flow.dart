import 'package:candy_store/checkout/presentation/view/checkout_page.dart';
import 'package:flutter/material.dart';

class CheckoutFlow extends StatefulWidget {
  const CheckoutFlow({super.key});

  @override
  State<CheckoutFlow> createState() => _CheckoutFlowState();
}

class _CheckoutFlowState extends State<CheckoutFlow> {
  @override
  Widget build(BuildContext context) {
    return CheckoutPage.withBloc();
  }
}
