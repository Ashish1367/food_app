import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/forms/sign_in_form.dart';
import 'package:food_app/screen/homePages/activity.dart';
import 'package:food_app/screen/homePages/home.dart';
import 'package:food_app/screen/homePages/profile.dart';
import 'package:food_app/screen/homePages/search.dart';
import 'package:food_app/screen/homePages/upload.dart';
import 'package:food_app/widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController = PageController();
  int _currindex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currindex = index;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignInForm()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        children: const [
          Home(),
          Search(),
          Upload(),
          Activity(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Bottom(
        currentIndex: _currindex,
        onItemTapped: _onItemTapped,
        pageController: _pageController,
      ),
    );
  }
}
