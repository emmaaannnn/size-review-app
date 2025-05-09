import 'package:fitview_app/screens/explore_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitview_app/screens/mainScreen.dart'; // Import the MainScreen
import 'package:fitview_app/screens/login_screen.dart'; // Import the LoginScreen
import 'package:fitview_app/model/user_model.dart';
import 'package:fitview_app/data/user_data.dart';
import 'package:provider/provider.dart';
import 'package:fitview_app/states/postState.dart'; // Import the PostState

void main() {
  User testUser = dummyUsers.firstWhere(
    (user) => user.username == "TestUser",
    orElse: () => dummyUsers[0], // Fallback user if TestUser isn't found
  );


  runApp(
    ChangeNotifierProvider(
      create: (context) => PostState(), // Initialize UserState
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitview App',
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: MainScreen(currentUser: testUser), // Set the initial screen to MainScreen
        
        // // Set the initial screen to LoginScreen
        // initialRoute: '/',
        // onGenerateRoute: (settings) {
        //   if (settings.name == '/main') {
        //     final User currentUser = settings.arguments as User;
        //     return MaterialPageRoute(
        //       builder: (context) => MainScreen(currentUser: currentUser),
        //     );
        //   }
        //   return MaterialPageRoute(builder: (context) => LoginScreen());
        // },
      ),
    ),
  );
}
