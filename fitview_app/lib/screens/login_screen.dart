import 'package:flutter/material.dart';
import 'package:fitview_app/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:fitview_app/states/userState.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
  String username = _usernameController.text.trim();
  String password = _passwordController.text.trim();

  // Retrieve users from UserState instead of dummyUsers
  UserState userState = Provider.of<UserState>(context, listen: false);

  User? user;

  try {
    user = userState.users.firstWhere(
      (user) => user.username == username && user.password == password,
    );
  } catch (e) {
    user = null; // No match found
  }

  if (user != null) {
    print('Login Successful! Welcome, ${user.name}');

    // Set logged-in user in UserState
    userState.setUser(user);

    // Navigate to MainScreen without manually passing currentUser
    Navigator.pushReplacementNamed(context, '/main');
  } else {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid Username or Password')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}