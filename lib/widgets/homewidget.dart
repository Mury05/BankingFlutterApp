import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarrouselOnBoarding extends StatefulWidget {
  const CarrouselOnBoarding({
    super.key,
    required this.pageController,
    required this.carouselItems,
  });

  final PageController pageController;
  final List<Map<String, String>> carouselItems;

  @override
  State<CarrouselOnBoarding> createState() => _CarrouselOnBoardingState();
}

class _CarrouselOnBoardingState extends State<CarrouselOnBoarding> {
  int currentIndex = 0;
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    widget.pageController.addListener(() {
      int newIndex = widget.pageController.page!.round();
      if (newIndex != currentIndex) {
        setState(() {
          opacity = 0.0;
        });

        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {
            currentIndex = newIndex;
            opacity = 1.0;
          });
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: widget.pageController,
          itemCount: widget.carouselItems.length,
          itemBuilder: (context, index) {
            final item = widget.carouselItems[index];
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item["image"]!,
                  fit: BoxFit.contain,
                ),

                // Contenu texte
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.pushNamed(context, '/login'),
                            },
                            child: const Text(
                              "SKIP",
                              style: TextStyle(
                                color: Color.fromARGB(255, 47, 81, 48),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),

                      // Animation du titre
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: index == currentIndex ? opacity : 0.0,
                        child: Text(
                          item["title"]!,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.green[900],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Animation du sous-titre (lettre par lettre)
                      TypewriterText(
                        text: item["subtitle"]!,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 47, 81, 48),
                        ),
                        duration: Duration(
                            milliseconds: 30), // Plus rapide pour le sous-titre
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
              controller: widget.pageController,
              count: widget.carouselItems.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.green.shade900,
                dotColor: Colors.green.shade400,
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

/// Widget pour l'effet "écriture progressive"
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;

  const TypewriterText({
    super.key,
    required this.text,
    required this.textStyle,
    this.duration = const Duration(milliseconds: 50),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    for (int i = 0; i <= widget.text.length; i++) {
      await Future.delayed(widget.duration);
      if (mounted) {
        setState(() {
          _currentLength = i;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.substring(0, _currentLength),
      style: widget.textStyle,
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
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            "OPEN AN ACCOUNT >",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
