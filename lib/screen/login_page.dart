import 'package:flutter/material.dart';
import 'package:food_app/screen/intro_page.dart';
import 'package:food_app/widgets/login_page_buttons.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

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
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const IntroPage();
            }));
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 215, 175, 247).withOpacity(.6),
          const Color.fromARGB(255, 172, 94, 236)
        ])),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(
                          duration: const Duration(milliseconds: 420),
                          delay: const Duration(milliseconds: 200)),
                  child: Image.asset('assets/log.png')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromBottom(
                            duration: const Duration(milliseconds: 430),
                            delay: const Duration(milliseconds: 210)),
                    child: const Text(
                      'Your Do Not Need To Search Different - Different Website For A Recipe And You Do Not Need Share Or Save Different - Different Links Of Recipes.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, 15),
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(
                              duration: const Duration(milliseconds: 440),
                              delay: const Duration(milliseconds: 220)),
                      child: const Text(
                        'Now You Can Create , Share And Show Your Skills In Cooking At One Place.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ),
              const LoginPageBt()
            ],
          ),
        ),
      ),
    );
  }
}
