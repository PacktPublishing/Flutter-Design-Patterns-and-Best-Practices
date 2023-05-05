import 'package:candy_store/cart_list_item.dart';
import 'package:candy_store/cart_list_item_view.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<CartListItem> items;
  final Function(CartListItem) onRemoveFromCart;
  final Function(CartListItem) onAddToCart;

  const CartPage({
    Key? key,
    required this.items,
    required this.onRemoveFromCart,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartListItem> _items = [];
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    _calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return CartListItemView(
                  item: item,
                  onRemoveFromCart: _removeFromCart,
                  onAddToCart: _addToCart,
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '$_totalPrice €',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeFromCart(CartListItem item) {
    setState(() {
      final index =
          _items.indexWhere((item) => item.product.id == item.product.id);
      if (index != -1) {
        final existingItem = _items[index];
        final newQuantity = existingItem.quantity - 1;
        if (newQuantity > 0) {
          _items[index] = CartListItem(
            product: existingItem.product,
            quantity: newQuantity,
          );
        } else {
          _items.removeAt(index);
        }
      }
      _calculateTotalPrice();
    });
    widget.onRemoveFromCart(item);
  }

  void _addToCart(CartListItem item) {
    setState(() {
      final index =
          _items.indexWhere((item) => item.product.id == item.product.id);
      if (index != -1) {
        final existingItem = _items[index];
        _items[index] = CartListItem(
          product: existingItem.product,
          quantity: existingItem.quantity + 1,
        );
      }
      _calculateTotalPrice();
    });
    widget.onAddToCart(item);
  }

  void _calculateTotalPrice() {
    _totalPrice = _items.fold(
      0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quantity,
    );
  }
}
