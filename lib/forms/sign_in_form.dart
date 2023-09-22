import 'package:flutter/material.dart';
import 'package:food_app/components/form_input.dart';
import 'package:food_app/components/form_top.dart';
import 'package:food_app/forms/sign_up_form.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              return const LoginPage();
            }));
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 216, 182, 244).withOpacity(.6),
          const Color.fromARGB(255, 172, 94, 236)
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const FormTop(
                    text1: 'Login', text2: 'Login To Your Existing Account'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      // signup(lable: 'UserName'),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromTop(
                                  duration: const Duration(milliseconds: 420),
                                  delay: const Duration(milliseconds: 220)),
                          child: const FormInput(
                              label: 'Email', obscureText: false)),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromTop(
                                  duration: const Duration(milliseconds: 430),
                                  delay: const Duration(milliseconds: 230)),
                          child: const FormInput(
                              label: 'Password', obscureText: true)),
                      // signup(lable: 'Confirm Password', obscureText: true)
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Column(
                    children: [
                      WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromBottom(
                                duration: const Duration(milliseconds: 400),
                                delay: const Duration(milliseconds: 200)),
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
                              ]),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text('Login'),
                          ),
                        ),
                      )
                    ],
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
                                delay: const Duration(milliseconds: 210)),
                        child: const Text("Don't Have An Account?")),
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
                                  delay: const Duration(milliseconds: 210)),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 98, 170)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                  duration: const Duration(milliseconds: 420),
                  delay: const Duration(milliseconds: 220)),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.78,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/SignIn.png'),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
