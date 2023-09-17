import 'package:flutter/material.dart';
// import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:food_app/widgets/login_page_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 216, 182, 244).withOpacity(.6),
            const Color.fromARGB(255, 172, 94, 236)
          ])),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 215, 175, 247).withOpacity(.6),
          const Color.fromARGB(255, 172, 94, 236)
        ])),
        child: Column(
          children: [
            Image.asset('assets/log.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                const Text(
                  'Your Do Not Need To Search Different - Different Website For A Recipe And You Do Not Need Share Or Save Different - Different Links Of Recipes.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Transform.translate(
                  offset: const Offset(0, 15),
                  child: const Text(
                    'Now You Can Create , Share And Show Your Skills In Cooking At One Place.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),
            const LoginPageBt()
          ],
        ),
      ),
    );
  }
}
