import 'package:flutter/material.dart';
import 'package:fitview_app/screens/mainScreen.dart'; // Import the MainScreen
import 'package:fitview_app/screens/login_screen.dart'; // Import the LoginScreen
import 'package:provider/provider.dart';
import 'package:fitview_app/states/postState.dart';
import 'package:fitview_app/states/userState.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostState()), // Manages posts
        ChangeNotifierProvider(create: (context) => UserState()), // Manages user login
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fitview App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: userState.currentUser != null ? MainScreen(currentUser: userState.currentUser!) : LoginScreen(), // Check login state
        );
      },
    );
  }
}