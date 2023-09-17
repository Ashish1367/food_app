import 'package:flutter/material.dart';
import 'package:food_app/screen/intro_page.dart';
// import 'package:food_app/screen/login_page.dart';
import 'package:lottie/lottie.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4.toInt()), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const IntroPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Lottie.asset('assets/lottie.json',
            fit: BoxFit.fill, frameRate: FrameRate.max),
      ),
    );
  }
}
