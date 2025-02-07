import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarrouselOnBoarding extends StatelessWidget {
  const CarrouselOnBoarding({
    super.key,
    required PageController pageController,
    required this.carouselItems,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<Map<String, String>> carouselItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carrousel avec PageView
        PageView.builder(
          controller: _pageController,
          itemCount: carouselItems.length,
          itemBuilder: (context, index) {
            final item = carouselItems[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                // Image de fond
                Image.asset(
                  item["image"]!,
                  fit: BoxFit.cover,
                ),
    
                // Contenu texte
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "SKIP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
    
                      const Spacer(),
    
                      // Texte principal
                      Text(
                        item["title"]!,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 50,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
    
                      const SizedBox(height: 20),
    
                      // Sous-texte
                      Text(
                        item["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
    
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
    
    
        // Indicateur de pages
        Positioned(
          bottom: 70,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: carouselItems.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 93, 117, 95),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "OPEN AN ACCOUNT >",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
