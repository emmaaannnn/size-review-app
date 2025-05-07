import 'package:flutter/material.dart';
import 'package:fitview_app/screens/mainScreen.dart'; // Import the MainScreen
import 'package:fitview_app/screens/login_screen.dart'; // Import the LoginScreen
import 'package:fitview_app/model/user_model.dart';
void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Hides the debug banner
//       title: 'Fitview App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainScreen(), // Set MainScreen as the home widget
//     );
//   }
// }

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitview App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/main') {
          final User currentUser = settings.arguments as User;
          return MaterialPageRoute(
            builder: (context) => MainScreen(currentUser: currentUser),
          );
        }
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },

    );
  }
}