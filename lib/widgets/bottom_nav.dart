import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  final PageController pageController;
  const Bottom(
      {Key? key,
      required this.currentIndex,
      required this.onItemTapped,
      required this.pageController})
      : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: Color(0xFF1f99fa)),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Upload',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Activity',
            backgroundColor: Colors.pink),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
            backgroundColor: Colors.purple),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.amber,
      onTap: (index) {
        widget.onItemTapped(index);
        widget.pageController.jumpToPage(index);
      },
    );
  }
}
