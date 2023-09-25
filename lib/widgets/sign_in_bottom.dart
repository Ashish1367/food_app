import 'package:flutter/material.dart';
import 'package:food_app/forms/sign_up_form.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignInBottom extends StatelessWidget {
  const SignInBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: [
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 200),
            ),
            child: Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 0,
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text('Login'),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromBottom(
                  duration: const Duration(milliseconds: 410),
                  delay: const Duration(milliseconds: 210),
                ),
                child: const Text("Don't Have An Account?"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUpForm();
                    }));
                  },
                  child: WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromBottom(
                      duration: const Duration(milliseconds: 410),
                      delay: const Duration(milliseconds: 210),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 98, 170),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
              duration: const Duration(milliseconds: 420),
              delay: const Duration(milliseconds: 220),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.78,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/SignIn.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
