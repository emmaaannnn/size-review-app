import 'package:flutter/material.dart';

import 'package:fitview_app/screens/mainScreen.dart'; // Import the MainScreen
import 'package:fitview_app/screens/auth_screen/auth_screen.dart'; // Import the LoginScreen

import 'package:provider/provider.dart';
import 'package:fitview_app/model/postState.dart';
import 'package:fitview_app/model/userState.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:fitview_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true); // Optional offline mode

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
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Listen to auth state changes
      builder: (context, snapshot) {
        User? firebaseUser = snapshot.data;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fitview App',
          theme: ThemeData(primarySwatch: Colors.blue),

          // ✅ No nested StreamBuilder—handle auth state directly here!
          home: firebaseUser == null ? AuthScreen() : MainScreen(),

          routes: {
            '/main': (context) => MainScreen(),
            '/auth': (context) => AuthScreen(),
          },
        );
      },
    );
  }
}