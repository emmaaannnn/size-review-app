import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class UserState extends ChangeNotifier {
  final List<User> _users = [];
  User? _currentUser;

  // Getting registered Users
  List<User> get users => List.unmodifiable(_users);

  // Get current user
  User? get currentUser => _currentUser;

  // Fetch users from Firestore
  Future<void> fetchUsersFromFirestore() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
      
      _users.clear(); // Clear existing users before adding new ones

      for (var doc in snapshot.docs) {
        _users.add(User(
          email: doc['email'],
          username: doc['username'],
          name: doc['name'],
          bio: doc['bio'],
          height: doc['height'],
          bodyType: _parseBodyType(doc['bodyType']),
          preferredFit: _parseFit(doc['preferredFit']),
        ));
      }

      notifyListeners(); // Notify UI that users list has changed
      print("Users fetched successfully!");
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  // Fetch the current user from Firestore
  Future<void> fetchCurrentUser() async {
  try {
    auth.User? firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) return; // No logged-in user

    // Search Firestore for a matching user by email
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: firebaseUser.email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot<Map<String, dynamic>> userDoc = querySnapshot.docs.first;
      _currentUser = User(
        email: userDoc['email'],
        username: userDoc['username'],
        name: userDoc['name'],
        bio: userDoc['bio'],
        height: userDoc['height'],
        bodyType: _parseBodyType(userDoc['bodyType']),
        preferredFit: _parseFit(userDoc['preferredFit']),
      );
    } else {
      // No Firestore match found—create a default profile
      _currentUser = User(
        email: firebaseUser.email!,
        username: firebaseUser.email!.split('@')[0],
        name: "NO USER FOUND",
        bio: "NEW USER DID NOT LOAD",
        height: 170.0,
        bodyType: BodyType.average,
        preferredFit: Fit.regular,
      );
    }

    notifyListeners(); // Update UI
    print("Current user loaded!");
  } catch (e) {
    print("Error fetching user from Firestore: $e");
  }
}


  // Removing Users
  void removeUser(User user) {
    _users.remove(user);
    notifyListeners();
  }

  // Set logged-in user
  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  // Clear logged-in user (for logout)
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }

  // Helper methods to parse Enums from Firestore
  BodyType _parseBodyType(String value) {
    return BodyType.values.firstWhere((e) => e.toString() == value, orElse: () => BodyType.athletic);
  }

  Fit _parseFit(String value) {
    return Fit.values.firstWhere((e) => e.toString() == value, orElse: () => Fit.regular);
  }
}
