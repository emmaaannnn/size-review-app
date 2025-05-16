import 'package:fitview_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fitview_app/widget/newPost.dart';
import 'package:fitview_app/widget/userWidget.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth; // Import FirebaseAuth
import 'package:fitview_app/data/user_data.dart';

class MeScreen extends StatefulWidget {
  final User currentUser;

  const MeScreen({super.key, required this.currentUser});

  @override
  State<MeScreen> createState() {
    return _Me();
  }
}

class _Me extends State<MeScreen> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (modalContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8, // Fixed height: 80% of screen
          child: NewPost(),
        );
      },
    );
  }

  // ✅ Logout function
  void _logout() async {
    await auth.FirebaseAuth.instance.signOut(); // Sign out user
    Navigator.pushReplacementNamed(context, '/auth'); // Redirect to AuthScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentUser.username), // Displaying the current user's name
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, // Action for "add" button
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      
      body: Column(
        children: [
          // UserWidget at the top
          UserWidget(currentUser: widget.currentUser), 

          SizedBox(height: 20),

          // Expanding the remaining space to center the button
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Keeps buttons centered
                children: [
                  ElevatedButton(
                    onPressed: _logout,
                    child: Text("Log Out"),
                  ),
                  SizedBox(height: 10), // Adds spacing between buttons
                  ElevatedButton(
                    onPressed: addDummyUsersToFirestore,
                    child: Text("Upload Dummy Users"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ), 
    );
  }
}
