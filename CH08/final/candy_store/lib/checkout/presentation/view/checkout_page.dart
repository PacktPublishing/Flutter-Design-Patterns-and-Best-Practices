import 'package:candy_store/checkout/presentation/bloc/checkout_cubit.dart';
import 'package:candy_store/checkout/presentation/bloc/checkout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();

  static Widget withBloc() {
    return BlocProvider<CheckoutCubit>(
      create: (context) => CheckoutCubit(
        context.read(),
      )..loadPaymentMethods(),
      child: const CheckoutPage(),
    );
  }
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final CheckoutCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(builder: (context, state) {
      return Scaffold(
        body: Center(
          child: TextButton(
            onPressed: _checkout,
            child: const Text('Checkout'),
          ),
        ),
      );
    });
  }

  void _checkout() {
    final paymentMethod = _cubit.state.paymentMethods.firstOrNull ?? 'Unknown';
    _cubit.checkout(paymentMethod);
    Navigator.pop(context);
  }
}
