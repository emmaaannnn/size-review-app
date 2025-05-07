import 'package:flutter/material.dart';
import 'package:fitview_app/model/user_model.dart';
import 'package:fitview_app/data/user_data.dart';
import 'package:fitview_app/screens/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      User user = dummyUsers.firstWhere(
        (user) => user.username == username && user.password == password,
      );

      print('Login Successful! Welcome, ${user.name}');

      // Navigate to MainScreen, passing the current user
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(currentUser: user),
        ),
      );
    } catch (e) {
      print('Invalid Username or Password');
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