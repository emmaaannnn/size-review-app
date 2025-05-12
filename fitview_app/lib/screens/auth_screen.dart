import 'package:flutter/material.dart';
import 'package:fitview_app/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:fitview_app/states/userState.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!_isLogin)
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (!_isLogin)
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text(_isLogin ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                });
              },
              child: Text(_isLogin ? "Don't have an account? Register" : "Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}