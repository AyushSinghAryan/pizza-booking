// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/pizza.dart';

class PizzaTile extends StatelessWidget {
  Pizza pizza;
  void Function()? onTap;
  void Function()? onDoubleTap;
  PizzaTile({
    Key? key,
    required this.pizza,
    required this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        child: Container(
          height: 210,
          width: 210,
          child: Column(
            children: [
              Hero(
                tag: pizza.imagePath,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    pizza.imagePath,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(pizza.pizzaName),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${pizza.price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
