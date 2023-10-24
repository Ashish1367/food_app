import 'package:flutter/material.dart';
import 'package:food_app/components/snack_bar.dart';
import 'package:food_app/forms/sign_in_form.dart';
import 'package:food_app/resources/auth_method.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignUpBottom extends StatefulWidget {
  final TextEditingController userController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController cnfPassController;
  const SignUpBottom(
      {Key? key,
      required this.userController,
      required this.emailController,
      required this.passController,
      required this.cnfPassController})
      : super(key: key);

  @override
  State<SignUpBottom> createState() => _SignUpBottomState();
}

class _SignUpBottomState extends State<SignUpBottom> {
  void signupUser() async {
    String res = await Authmethod().signUpUser(
        username: widget.userController.text,
        email: widget.emailController.text,
        password: widget.passController.text,
        cnfpassword: widget.cnfPassController.text);
    if (res == "success") {
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 15,
          ),
          child: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
              duration: const Duration(milliseconds: 420),
              delay: const Duration(milliseconds: 220),
            ),
            child: Container(
              height: 60,
              width: 150,
              decoration: BoxDecoration(
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
                onPressed: signupUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
                duration: const Duration(milliseconds: 430),
                delay: const Duration(milliseconds: 230),
              ),
              child: const Text('Already Have An Account?'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInForm();
                  }));
                },
                child: WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(
                    duration: const Duration(milliseconds: 430),
                    delay: const Duration(milliseconds: 230),
                  ),
                  child: const Text(
                    'Login',
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
      ],
    );
  }
}
