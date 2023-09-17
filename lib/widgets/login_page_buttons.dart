import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class LoginPageBt extends StatelessWidget {
  const LoginPageBt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: AnimatedButton(
              text: 'Sign In',
              width: 200,
              height: 70,
              isReverse: true,
              selectedGradientColor: LinearGradient(colors: [
                const Color(0xFFffc0cb).withOpacity(.7),
                const Color(0xFFffc0cb)
              ]),
              gradient: LinearGradient(colors: [
                Colors.purple.withOpacity(0.6),
                const Color.fromARGB(255, 191, 101, 207)
              ]),
              selectedTextColor: Colors.white,
              transitionType: TransitionType.CENTER_LR_IN,
              borderRadius: 50,
              borderColor: const Color.fromARGB(255, 210, 133, 224),
              borderWidth: 1,
              onPress: () {
                showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: 'Sign Up',
                  context: context,
                  pageBuilder: (context, _, __) => Center(
                    child: Container(
                      height: 620,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: AnimatedButton(
              text: 'Sign Up',
              width: 200,
              height: 70,
              isReverse: true,
              selectedGradientColor: LinearGradient(colors: [
                const Color(0xFFffc0cb).withOpacity(.7),
                const Color(0xFFffc0cb)
              ]),
              gradient: LinearGradient(colors: [
                Colors.purple.withOpacity(0.6),
                const Color.fromARGB(255, 191, 101, 207)
              ]),
              selectedTextColor: Colors.white,
              transitionType: TransitionType.CENTER_LR_IN,
              borderColor: const Color.fromARGB(255, 210, 133, 224),
              borderWidth: 1,
              borderRadius: 50,
              onPress: () {
                showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: 'Sign Up',
                  context: context,
                  pageBuilder: (context, _, __) => Center(
                    child: Container(
                      height: 620,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
