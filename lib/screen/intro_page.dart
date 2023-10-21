import 'package:flutter/material.dart';
import 'package:food_app/intro_page_screens/intro1.dart';
import 'package:food_app/intro_page_screens/intro2.dart';
import 'package:food_app/intro_page_screens/intro3.dart';
import 'package:food_app/widgets/page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onlastpage = (index == 2);
              });
            },
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
          PageIndicator(
            controller: _controller,
            onLastPage: onlastpage,
          )
        ],
      ),
    );
  }
}
