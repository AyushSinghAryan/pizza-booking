// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/pizza.dart';

class PizzaBuy extends StatefulWidget {
  Pizza pizza;
  // Pizza pizza;
  PizzaBuy({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  @override
  State<PizzaBuy> createState() => _PizzaBuyState();
}

class _PizzaBuyState extends State<PizzaBuy> {
  void addWatchToCart(Pizza pizza) {
    Provider.of<Cart>(context, listen: false).addItemToCart(pizza);

    //alert the user , shoe successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your Cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, value, child) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(55.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black),
                  elevation: 0,
                  actions: [
                    Container(
                        width: 220,
                        // color: Colors.amber,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'Order Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        )),
                    const SizedBox(
                      width: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.favorite, color: Colors.pink),
                    )
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Center(
                    child: Hero(
                      tag: widget.pizza.imagePath,
                      child: SizedBox(
                          height: 300,
                          width: 300,
                          // color: Colors.amber,
                          child: Image.asset(widget.pizza.imagePath)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.pizza.pizzaName,
                    style: const TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.clock,
                        size: 20,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '15 Mins   🔥 320 kcal    ⭐ 4 (1k Reviews)',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey[800],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "₹${widget.pizza.price}",
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "About Pizza",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Pizza is a beloved dish that has captured the hearts and taste buds of people worldwide. Originating from Italy, it has become a global sensation, offering a delightful combination of flavors and textures.A typical pizza consists of a round, thin crust topped with a savory tomato sauce and melted cheese.However, the possibilities for toppings are endless, allowing for a wide range of creative and delicious variations.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () => addWatchToCart(widget.pizza),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFf5835d)),
                      // color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ));
  }
}
