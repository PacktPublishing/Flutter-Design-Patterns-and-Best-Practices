import 'package:candy_store/cart/presentation/widget/cart_button.dart';
import 'package:candy_store/product/presentation/widget/product_list_item_view.dart';
import 'package:flutter/material.dart';

import 'test_data.dart';

class CandyShopWidgetsPage extends StatelessWidget {
  const CandyShopWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductListItemView(
              item: TestData.testProductListItem,
              forTest: true,
            ),
            const CartButton(
              count: 2,
            ),
            Text('displaySmall', style: Theme.of(context).textTheme.displaySmall),
            Text('bodyLarge', style: Theme.of(context).textTheme.bodyLarge),
            Text('bodyMedium', style: Theme.of(context).textTheme.bodyMedium),
            Text('bodySmall', style: Theme.of(context).textTheme.bodySmall),
            Text('titleMedium', style: Theme.of(context).textTheme.titleMedium),
            Text('labelMedium', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
