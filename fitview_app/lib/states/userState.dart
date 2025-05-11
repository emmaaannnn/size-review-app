import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/user_model.dart';
import 'package:fitview_app/data/user_data.dart';

class UserState extends ChangeNotifier {
  final List<User> _users = List.from(dummyUsers);
  User? _currentUser;

  // Getting registered Users
  List<User> get users => List.unmodifiable(_users);

  // Get current user
  User? get currentUser => _currentUser;

  // Adding Users (Prevent Duplicates)
  void addUser(User user) {
    if (!_users.any((existingUser) => existingUser.username == user.username)) {
      _users.add(user);
      notifyListeners();
    } else {
      print("User already exists!");
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
}
