import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/user_model.dart';

class UserState extends ChangeNotifier {
  final List<User> _users = [];

  // Getting Users
  List<User> get users => List.unmodifiable(_users);

  // Adding Users
  void addUser(User user) {
    _users.add(user);
    notifyListeners(); // Notify listeners about the change
  }

  // Removing Users
  void removeUser(User user) {
    _users.remove(user);
    notifyListeners(); // Notify listeners about the change
  }
}
