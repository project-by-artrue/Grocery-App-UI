// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  List<Widget>? slideList;
  int? initialPage;

  @override
  void initState() {
    _pageController = PageController(initialPage: 2);
    initialPage = _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Get Favorite Items",
            body:
                "Select your location to see the wide range stores and order your desired item",
            image: Image.asset("asset/FevoriteItems.png"),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Easy Payment",
            body:
                "Order item with COD payment or pay by safer and fasterpayment gateway",
            image: Image.asset("asset/EasyPayment.png"),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Fast Delivery",
            body:
                "Hundreds of delivery man are waiting for your order so place your order and get the items delivery to your doorstep",
            image: Image.asset("asset/FastDelivery.png"),
            decoration: pageDecoration,
          ),
        ],
        showSkipButton: true,
        skip: const Text("Skip"),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        next: Text(
          "Next",
          style: TextStyle(color: Colors.white),
        ),
        onDone: () {
          Navigator.pushReplacementNamed(context, 'BottomBar');
        },
        baseBtnStyle: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        skipStyle: TextButton.styleFrom(primary: Colors.green),
        doneStyle: ElevatedButton.styleFrom(primary: Colors.green),
        nextStyle: ElevatedButton.styleFrom(primary: Colors.green),
        backStyle: TextButton.styleFrom(primary: Colors.black),
      ),
    );
  }
}
