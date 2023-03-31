import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intro(),
    ),
  );
}

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final Controller = PageController();
  @override
  void dispose() {
    Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: Controller,
          children: [
            Container(
              child: Image.asset(
                "assets/images/i1.png",
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/i2.png",
              ),
            ),
            Container(
              child: Image.asset(
                "assets/images/i3.png",
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Controller.jumpToPage(2),
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: Controller,
                  count: 3,
                  effect: const WormEffect(
                      spacing: 6,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.greenAccent),
                  onDotClicked: (i) => Controller.animateToPage(i,
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut),
                ),
              ),
              TextButton(
                  onPressed: () => Controller.nextPage(
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInOut),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.green),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
