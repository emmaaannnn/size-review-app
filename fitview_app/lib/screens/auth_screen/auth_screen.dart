import 'package:flutter/material.dart';
import 'package:fitview_app/screens/auth_screen/auth_widget.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
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
              onPressed: () {
                if (_isLogin) {
                  AuthWidget.login(context, _emailController.text.trim(), _passwordController.text.trim());
                } else {
                  AuthWidget.register(
                    context,
                    _emailController.text.trim(),
                    _emailController.text.trim().split('@')[0], // Generate username from email
                    _passwordController.text.trim(),
                    _confirmPasswordController.text.trim(),
                  );
                }
              },
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