import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

        // Create new user profile
        User newUser = User(
          email: firebaseUser.email!,
          username: username.isNotEmpty ? username : firebaseUser.email!.split('@')[0],
          name: "New User",
          bio: "Welcome to FitView!",
          height: 170.0,
          bodyType: BodyType.average,
          preferredFit: Fit.regular,
        );

        // Store user in Firestore instead of dummyUsers
        await FirebaseFirestore.instance.collection('users').doc(newUser.email).set({
          'email': newUser.email,
          'username': newUser.username,
          'name': newUser.name,
          'bio': newUser.bio,
          'height': newUser.height,
          'bodyType': newUser.bodyType.toString(),
          'preferredFit': newUser.preferredFit.toString(),
        });

        // Update UserState
        Provider.of<UserState>(context, listen: false).setUser(newUser);

        Navigator.pushReplacementNamed(context, '/main'); // Navigate after registration
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Failed: ${e.toString()}")),
      );
    }
  }
}