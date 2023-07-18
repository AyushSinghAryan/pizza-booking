import 'package:flutter/material.dart';
import 'package:pizza_booking/components/Cart_Item.dart';
import 'package:pizza_booking/models/cart.dart';
import 'package:pizza_booking/models/pizza.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void payNow() {}
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // heading
                    Center(
                      child: const Text(
                        'My Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFFf5835d)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Expanded(
                        child: ListView.builder(
                      // jitney item user add karey
                      itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        Pizza individualShoe = value.getUserCart()[index];
                        return CartItem(
                          pizza: individualShoe,
                        );
                      },
                    )),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFf5835d),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Price",
                                  style: TextStyle(color: Colors.grey[100]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "₹" + value.calculateTotal(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 238, 165, 141)),
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Text(
                                    'Pay Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.bold,fontSize: 18
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

// Text(
//                               