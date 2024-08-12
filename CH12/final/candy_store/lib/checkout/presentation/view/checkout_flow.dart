import 'package:candy_store/checkout/data/repository/stub_checkout_repository.dart';
import 'package:candy_store/checkout/domain/repository/checkout_repository.dart';
import 'package:candy_store/checkout/presentation/view/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutFlow extends StatefulWidget {
  const CheckoutFlow({super.key});

  @override
  State<CheckoutFlow> createState() => _CheckoutFlowState();
}

class _CheckoutFlowState extends State<CheckoutFlow> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<CheckoutRepository>(
        create: (context) => StubCheckoutRepository(),
      ),
    ], child: CheckoutPage.withBloc());
  }
}
