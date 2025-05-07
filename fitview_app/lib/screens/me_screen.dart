import 'package:fitview_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fitview_app/data/post_data.dart';
import 'package:fitview_app/widget/newPost.dart';
import 'package:fitview_app/model/post_model.dart';

class MeScreen extends StatefulWidget {
  final User currentUser;

  const MeScreen({super.key, required this.currentUser});

  @override
  State<MeScreen> createState() {
    return _Me();
  }
}

class _Me extends State<MeScreen> {
  List<Post> posts = List.from(dummyPosts);

  void _addNewPost(Post newPost) {
    setState(() {
      posts.insert(0, newPost); // Inserts new post at the top
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (modalContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8, // Fixed height: 80% of screen
          child: NewPost(onPostCreated: _addNewPost),
        );
      },
    );
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
      //return 
    );
  }
}
