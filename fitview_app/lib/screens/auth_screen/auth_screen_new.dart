import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:fitview_app/model/user_model.dart';
import 'package:fitview_app/model/userState.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  BodyType _selectedBodyType = BodyType.average;
  Fit _selectedFit = Fit.regular;

  void _saveProfile() async {
    auth.User? firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) return;

    User newUser = User(
      email: firebaseUser.email!,
      username: _usernameController.text,
      name: _nameController.text,
      bio: _bioController.text,
      height: double.tryParse(_heightController.text) ?? 170.0,
      bodyType: _selectedBodyType,
      preferredFit: _selectedFit,
    );

    await FirebaseFirestore.instance.collection('users').doc(newUser.email).set({
      'email': newUser.email,
      'username': newUser.username,
      'name': newUser.name,
      'bio': (newUser.bio != null && newUser.bio!.isNotEmpty) ? newUser.bio : null,
      'height': newUser.height,
      'bodyType': newUser.bodyType.toString(),
      'preferredFit': newUser.preferredFit.toString(),
    });

    // Update UserState
    Provider.of<UserState>(context, listen: false).setUser(newUser);

    // Navigate to the main screen after saving the profile
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete Your Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: _nameController, decoration: InputDecoration(labelText: "Full Name")),
            TextField(controller: _bioController, decoration: InputDecoration(labelText: "Bio")),
            TextField(controller: _heightController, decoration: InputDecoration(labelText: "Height (cm)"), keyboardType: TextInputType.number),

            DropdownButton<BodyType>(
              value: _selectedBodyType,
              onChanged: (newValue) => setState(() => _selectedBodyType = newValue!),
              items: BodyType.values.map((type) =>
                DropdownMenuItem(value: type, child: Text(type.toString().split('.').last))
              ).toList(),
            ),

            DropdownButton<Fit>(
              value: _selectedFit,
              onChanged: (newValue) => setState(() => _selectedFit = newValue!),
              items: Fit.values.map((fit) =>
                DropdownMenuItem(value: fit, child: Text(fit.toString().split('.').last))
              ).toList(),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: Text("Save Profile"))
          ],
        ),
      ),
    );
  }
}