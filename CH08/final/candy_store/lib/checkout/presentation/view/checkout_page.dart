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
      if (state.checkoutResult.isInProgress) {
        return Scaffold(
          appBar: AppBar(title: const Text('Checkout')),
          body: const Center(child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
          appBar: AppBar(title: const Text('Checkout')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Payment Method:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                ...state.paymentMethods.map(
                  (method) => Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(method),
                      leading: Radio(
                        value: method,
                        groupValue: state.selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            _cubit.selectPaymentMethod(value as String);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.selectedPaymentMethod != 'none'
                        ? _checkout
                        : null,
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  void _checkout() {
    final paymentMethod = _cubit.state.selectedPaymentMethod;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checked out with $paymentMethod'),
      ),
    );
    _cubit.checkout(paymentMethod);
    Navigator.pop(context);
  }
}
