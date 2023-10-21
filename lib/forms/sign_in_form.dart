import 'package:flutter/material.dart';
import 'package:food_app/components/form_input.dart';
import 'package:food_app/components/form_top.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:food_app/widgets/sign_in_bottom.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
            const FormTop(
                text1: 'Login', text2: 'Login To Your Existing Account'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: const Duration(milliseconds: 420),
                              delay: const Duration(milliseconds: 220)),
                      child: FormInput(
                        label: 'Email',
                        obscureText: false,
                        textEditingController: _emailController,
                        textInputType: TextInputType.emailAddress,
                      )),
                  WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromTop(
                              duration: const Duration(milliseconds: 430),
                              delay: const Duration(milliseconds: 230)),
                      child: FormInput(
                        label: 'Password',
                        obscureText: true,
                        textEditingController: _passwordController,
                        textInputType: TextInputType.text,
                      )),
                ],
              ),
            ),
            const SignInBottom(),
          ],
        ),
      ),
    );
  }
}
