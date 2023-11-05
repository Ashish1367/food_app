import 'package:flutter/material.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/screen/home_page_screens/activity.dart';
import 'package:food_app/screen/home_page_screens/home.dart';
import 'package:food_app/screen/home_page_screens/profile.dart';
import 'package:food_app/screen/home_page_screens/search.dart';
import 'package:food_app/screen/home_page_screens/upload.dart';
import 'package:food_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

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
    adddata();
    super.initState();
  }

  adddata() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.updateUser();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onItemTapped,
        // physics: const NeverScrollableScrollPhysics(),
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
