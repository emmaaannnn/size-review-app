import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitview_app/data/user_data.dart'; // Import your dummy user data
import 'package:fitview_app/model/userState.dart';
import 'package:fitview_app/model/user_model.dart';

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

        // Find matching user from dummyUsers based on email
        User? matchingUser = dummyUsers.firstWhere(
          (user) => user.email == firebaseUser.email,
          orElse: () => User( // If user not found, create default profile
            email: firebaseUser.email!,
            username: firebaseUser.email!.split('@')[0],
            name: "New User",
            bio: "Welcome to FitView!",
            height: 170.0,
            bodyType: BodyType.average,
            preferredFit: Fit.regular,
          ),
        );

        // Store user in UserState
        Provider.of<UserState>(context, listen: false).setUser(matchingUser);

        Navigator.pushReplacementNamed(context, '/main');
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
      // Create user in Firebase Authentication
      auth.UserCredential userCredential = await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      auth.User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        print('Registration Successful! Welcome, ${firebaseUser.email}');

        // Create default user profile
      User newUser = User(
        email: firebaseUser.email!,
        username: username.isNotEmpty ? username : firebaseUser.email!.split('@')[0],
        name: "New User",
        bio: "Welcome to FitView!",
        height: 170.0,
        bodyType: BodyType.average,
        preferredFit: Fit.regular,
      );

      // Add new user to dummyUsers list
      dummyUsers.add(newUser);

      // Store user in UserState
      Provider.of<UserState>(context, listen: false).setUser(newUser);

      Navigator.pushReplacementNamed(context, '/main');

      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Failed: ${e.toString()}")),
      );
    }
  }
}