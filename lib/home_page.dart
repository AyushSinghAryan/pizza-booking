import 'package:flutter/material.dart';
import 'package:pizza_booking/components/pizza_tile.dart';
import 'package:pizza_booking/models/pizza.dart';
import 'package:pizza_booking/models/cart.dart';
import 'package:pizza_booking/pizza_buy.dart';
// import 'package:pizza_booking/components/image_slider.dart';
import 'package:pizza_booking/scroll_dart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

// import 'components/image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<String> images = [
    'lib/assets/piz1.jpg',
    'lib/assets/piz2.jpg',
    'lib/assets/piz3.jpg',
    'lib/assets/piz4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
              // resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(55.0),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black),
                  elevation: 0,
                  actions: [
                    Container(width: 200, child: DropdownDemo()),
                    const SizedBox(
                      width: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                          onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()),
                              )),
                          child: Icon(Icons.shopping_cart_outlined)),
                    )
                  ],
                ),
              ),
              drawer: Drawer(
                backgroundColor: Color(0xFFfff9f4),
                child: Column(
                  children: [
                    // logo
                    DrawerHeader(
                      child: Image.asset('lib/assets/pizlogo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Divider(
                        color: Colors.grey[800],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Color(0xFFf5835d),
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: Color(0xFFf5835d)),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Color(0xFFf5835d),
                        ),
                        title: Text(
                          'About',
                          style: TextStyle(color: Color(0xFFf5835d)),
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Color(0xFFf5835d),
                        ),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Color(0xFFf5835d)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              body: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                  minWidth: constraints.maxWidth,
                                ),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: constraints.maxHeight,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1.0,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: images.map((String imageUrl) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: constraints.maxWidth,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.asset(
                                              imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Find your pizza here...',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Popular",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(child: Container()),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: Cart().getPizzaList().length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            Pizza pizza = value.getPizzaList()[index];
                            return PizzaTile(
                              pizza: pizza,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PizzaBuy(
                                          pizza: pizza,
                                        )),
                              ),
                              onDoubleTap: () => addWatchToCart(pizza),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ));
  }
}
