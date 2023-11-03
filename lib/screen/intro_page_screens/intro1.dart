import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(164, 222, 1, 80),
      child: const Center(
        child: Text('Intro Page 1'),
      ),
    );
  }
}
