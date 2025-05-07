import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'following_screen.dart';
import 'me_screen.dart';
import '../widget/bottomNavBar.dart'; // Import your BottomNavBar widget
import '../model/user_model.dart';

class MainScreen extends StatefulWidget {
  final User currentUser;

  const MainScreen({super.key, required this.currentUser});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Pass the logged-in user to MeScreen
    _pages = [
      ExploreScreen(),
      FollowingScreen(),
      MeScreen(currentUser: widget.currentUser),
    ];
  }

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
