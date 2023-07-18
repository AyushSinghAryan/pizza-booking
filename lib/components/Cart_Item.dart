// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pizza_booking/models/cart.dart';

import '../models/pizza.dart';

class CartItem extends StatefulWidget {
  Pizza pizza;
  CartItem({super.key, required this.pizza});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart

  void removeItemfromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.pizza);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(widget.pizza.imagePath),
          title: Text(widget.pizza.pizzaName),
          subtitle: Text('₹' + widget.pizza.price),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Color(0xFFf5835d),
            ),
            onPressed: removeItemfromCart,
          ),
        ),
      ),
    );
  }
}
