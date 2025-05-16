import 'package:flutter/material.dart';

import 'explore_screen.dart';
import 'following_screen.dart';
import 'me_screen.dart';
import '../widget/bottomNavBar.dart'; // Import your BottomNavBar widget

import '../model/user_model.dart';
import '../model/userState.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
      super.initState();
      _pages = []; // Initialize empty, we will populate it dynamically later
      Future.microtask(() => Provider.of<UserState>(context, listen: false).fetchCurrentUser());
    }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = auth.FirebaseAuth.instance.currentUser; // Get logged-in Firebase user
    UserState userState = Provider.of<UserState>(context);
    User? currentUser = userState.currentUser; // Get app user from UserState

    if (currentUser == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show loading while fetching user
        ),
      );
    }

    if (firebaseUser == null) {
      return Scaffold(
        body: Center(child: Text("No user logged in!")),
      );
    }

    // Find the matching user from dummyUsers
    currentUser = userState.currentUser;

    // Store user in `UserState` for easy access later
    // userState.setUser(currentUser);

    // Initialize screens after retrieving the logged-in user
    _pages = [
      ExploreScreen(),
      FollowingScreen(),
      //MeScreen(currentUser),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
