// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Carousel Slider Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   List<String> images = [
//     'lib/assets/piz1.jpg',
//     'lib/assets/piz2.jpg',
//     'lib/assets/piz3.jpg',
//     'lib/assets/piz4.jpg',
//   ];

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Welcome to the Carousel Slider Demo!',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue, width: 2.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: SingleChildScrollView(
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minHeight: constraints.maxHeight,
//                           minWidth: constraints.maxWidth,
//                         ),
//                         child: CarouselSlider(
//                           options: CarouselOptions(
//                             height: constraints.maxHeight,
//                             aspectRatio: 16 / 9,
//                             viewportFraction: 1.0,
//                             initialPage: 0,
//                             enableInfiniteScroll: true,
//                             reverse: false,
//                             autoPlay: true,
//                             autoPlayInterval: Duration(seconds: 3),
//                             autoPlayAnimationDuration: Duration(milliseconds: 800),
//                             autoPlayCurve: Curves.fastOutSlowIn,
//                             enlargeCenterPage: true,
//                             scrollDirection: Axis.horizontal,
//                           ),
//                           items: images.map((String imageUrl) {
//                             return Builder(
//                               builder: (BuildContext context) {
//                                 return Container(
//                                   width: constraints.maxWidth,
//                                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     child: Image.asset(
//                                       imageUrl,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
