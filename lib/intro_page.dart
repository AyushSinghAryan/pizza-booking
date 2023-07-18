import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:pizza_booking/components/image_slider.dart';
import 'package:pizza_booking/pizza_buy.dart';
import 'package:pizza_booking/scroll_dart.dart';

import 'home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: const Color(0xFFfff9f4),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets4.lottiefiles.com/private_files/lf30_ewzbzcaw.json'),
              const SizedBox(
                height: 48,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText("Order, Enjoy, Repeat!",
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                " The Ultimate App for Easy Ordering and Tasty Pizzas!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              GestureDetector(
                  onTap: (() => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      )),
                  // onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFf5835d),
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(25),
                    child: const Center(
                      child: Text(
                        'Order and Enjoy',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
