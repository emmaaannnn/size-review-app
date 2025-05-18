import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fitview_app/model/user_state.dart';
import 'package:fitview_app/screens/auth_screen/auth_screen_new.dart';

class AuthWidget {
  static Future<void> login(BuildContext context, String email, String password) async {
    try {
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      auth.User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        print('Login Successful! Welcome, ${firebaseUser.email}');

        UserState userState = Provider.of<UserState>(context, listen: false);
        await userState.fetchCurrentUser(); // Fetch user from Firestore

        if (userState.currentUser == null) {
          print("No matching user found in Firestore!");
        }

        Navigator.pushReplacementNamed(context, '/main'); // Navigate after login
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: ${e.toString()}")),
      );
    }
  }

  static Future<void> register(BuildContext context, String email, String username, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match!")),
      );
      return;
    }

    try {
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      auth.User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        print('Registration Successful! Welcome, ${firebaseUser.email}');

        // Navigate to profile setup screen instead of main
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Failed: ${e.toString()}")),
      );
    }
  }
}