import 'package:flutter/material.dart';
import 'package:food_app/components/form_input.dart';
import 'package:food_app/components/form_top.dart';
import 'package:food_app/screen/login_page.dart';
import 'package:food_app/widgets/sign_up_bottom.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    _confirmController.dispose();
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
                          child: FormInput(
                            label: 'UserName',
                            obscureText: false,
                            textEditingController: _userController,
                            textInputType: TextInputType.text,
                          )),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromTop(
                                  duration: const Duration(milliseconds: 430),
                                  delay: const Duration(milliseconds: 230)),
                          child: FormInput(
                            label: 'Email',
                            obscureText: false,
                            textEditingController: _emailController,
                            textInputType: TextInputType.emailAddress,
                          )),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromBottom(
                                  duration: const Duration(milliseconds: 400),
                                  delay: const Duration(milliseconds: 200)),
                          child: FormInput(
                            label: 'Password',
                            obscureText: true,
                            textEditingController: _passwordController,
                            textInputType: TextInputType.text,
                          )),
                      WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromBottom(
                                  duration: const Duration(milliseconds: 410),
                                  delay: const Duration(milliseconds: 210)),
                          child: FormInput(
                            label: 'Confirm Password',
                            obscureText: true,
                            textEditingController: _confirmController,
                            textInputType: TextInputType.text,
                          )),
                    ],
                  ),
                ),
                SignUpBottom(
                  userController: _userController,
                  emailController: _emailController,
                  passController: _passwordController,
                  cnfPassController: _confirmController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
