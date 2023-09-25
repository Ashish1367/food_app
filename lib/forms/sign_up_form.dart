import 'package:flutter/material.dart';
import 'package:food_app/components/form_input.dart';
import 'package:food_app/components/form_top.dart';
// import 'package:food_app/forms/sign_in_form.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:food_app/widgets/sign_up_bottom.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 216, 182, 244).withOpacity(.6),
              const Color.fromARGB(255, 172, 94, 236),
            ]),
          ),
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
            const Color.fromARGB(255, 172, 94, 236),
          ]),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const FormTop(
                    text1: 'Sign Up', text2: 'Sign Up For A New Account'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromTop(
                                  duration: const Duration(milliseconds: 420),
                                  delay: const Duration(milliseconds: 220)),
                          child: const FormInput(
                              label: 'UserName', obscureText: false)),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromTop(
                                  duration: const Duration(milliseconds: 430),
                                  delay: const Duration(milliseconds: 230)),
                          child: const FormInput(
                              label: 'Email', obscureText: false)),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromBottom(
                                  duration: const Duration(milliseconds: 400),
                                  delay: const Duration(milliseconds: 200)),
                          child: const FormInput(
                              label: 'Password', obscureText: true)),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromBottom(
                                  duration: const Duration(milliseconds: 410),
                                  delay: const Duration(milliseconds: 210)),
                          child: const FormInput(
                              label: 'Confirm Password', obscureText: true)),
                    ],
                  ),
                ),
                const SignUpBottom(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
