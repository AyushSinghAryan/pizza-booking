import 'package:flutter/widgets.dart';
import 'package:pizza_booking/models/pizza.dart';

class Cart extends ChangeNotifier {
  List<Pizza> pizzaShop = [
    Pizza(
        imagePath: 'lib/assets/mypiz4.png',
        pizzaName: 'Cheese Pizza',
        price: '120'),
    Pizza(
        imagePath: 'lib/assets/mypiz1.png',
        pizzaName: 'Margherita',
        price: '180'),
    Pizza(
        imagePath: 'lib/assets/mypiz2.png',
        pizzaName: 'Veggie Pizza',
        price: '280'),
    Pizza(
        imagePath: 'lib/assets/mypiz3.png',
        pizzaName: 'Supreme Pizza',
        price: '140'),
    Pizza(
        imagePath: 'lib/assets/mypiz5.png',
        pizzaName: 'Greek Pizza',
        price: '240'),
    Pizza(
        imagePath: 'lib/assets/mypiz6.png',
        pizzaName: 'Chicken Pizza',
        price: '160'),
  ];

  List<Pizza> getPizzaList() {
    return pizzaShop;
  }

  // list of item in user cart
  List<Pizza> userCart = [];

  // get cart
  List<Pizza> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Pizza pizza) {
    userCart.add(pizza);
    notifyListeners();
  }

  // add item to cart
  void removeItemFromCart(Pizza pizza) {
    userCart.remove(pizza);
    notifyListeners();
  }

  //calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < userCart.length; i++) {
      totalPrice += double.parse(userCart[i].price);
    }
    return totalPrice.toString();
  }
}
