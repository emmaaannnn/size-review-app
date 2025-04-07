import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'following_screen.dart';
import 'me_screen.dart';
import '../widget/bottomNavBar.dart'; // Import your BottomNavBar widget

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ExploreScreen(),
    FollowingScreen(),
    MeScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
