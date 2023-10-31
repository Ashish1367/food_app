import 'package:flutter/material.dart';
import 'package:food_app/components/post_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("CookHub")),
      ),
      body: const PostCard(),
    );
  }
}
