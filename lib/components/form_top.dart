import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class FormTop extends StatelessWidget {
  final String text1;
  final String text2;

  const FormTop({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 200),
          ),
          child: Text(
            text1,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
            duration: const Duration(milliseconds: 410),
            delay: const Duration(milliseconds: 210),
          ),
          child: Text(
            text2,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
