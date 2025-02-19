import 'package:flutter/material.dart';
import 'package:banking_flutter_app/widgets/homewidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> carouselItems = [
    {
      "image": "img2.png",
      "title": "Your money,\nyour control",
      "subtitle":
          "Manage your finances seamlessly\nwith our cutting-edge solutions."
    },
    {
      "image": "img3.png",
      "title": "Step into\nthe banking\nfuture now",
      "subtitle":
          "We will do everything but count coins.\nFaster, easier, and more convenient."
    },
    {
      "image": "img1.png",
      "title": "Security &\nInnovation",
      "subtitle":
          "Banking redefined for the digital age.\nExperience secure and smart banking."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarrouselOnBoarding(
          pageController: _pageController, carouselItems: carouselItems),

      // Bouton "Open an Account"
      bottomNavigationBar: HomeBottomNavigation(),
    );
  }
}
