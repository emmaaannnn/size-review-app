import 'package:flutter/material.dart';
import 'package:fitview_app/widget/postWidget.dart';
import 'package:fitview_app/data/post_data.dart';
import 'package:fitview_app/widget/newPost.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() {
    return _Explore();
  }

}

class _Explore extends State<ExploreScreen> {

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (modalContext) => NewPost());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
        ),
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          return PostWidget(post: dummyPosts[index]);
        },
      ),
    );
  }
}