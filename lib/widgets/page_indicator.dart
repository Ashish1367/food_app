import 'package:flutter/material.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final bool onLastPage;
  const PageIndicator(
      {super.key, required this.controller, required this.onLastPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, .7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () {
                controller.jumpToPage(2);
              },
              child: const Text(
                'Skip',
              )),
          Transform.translate(
            offset: const Offset(150, 0),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                  dotColor: Colors.black54,
                  activeDotColor: Color.fromARGB(168, 252, 57, 122)),
            ),
          ),
          Expanded(
            child: onLastPage
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));
                    },
                    child: const Text(
                      'Get Started',
                      textAlign: TextAlign.end,
                    ))
                : GestureDetector(
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(microseconds: 200),
                          curve: Curves.easeIn);
                    },
                    child: const Text(
                      'Next',
                      textAlign: TextAlign.right,
                    )),
          )
        ],
      ),
    );
  }
}
