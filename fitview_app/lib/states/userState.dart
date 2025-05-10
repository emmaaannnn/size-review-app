import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/user_model.dart';

class UserState extends ChangeNotifier {
  final List<User> _users = [];
  User? _currentUser;

  // Getting registered Users
  List<User> get users => List.unmodifiable(_users);

  // Get current user
  User? get currentUser => _currentUser;

  // Adding Users
  void addUser(User user) {
    _users.add(user);
    notifyListeners();
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
