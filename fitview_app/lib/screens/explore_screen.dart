import 'package:flutter/material.dart';
import 'package:fitview_app/widget/postWidget.dart';
import 'package:fitview_app/data/post_data.dart';
import 'package:fitview_app/widget/newPost.dart';
import 'package:fitview_app/widget/searchDelegate.dart';

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
      isScrollControlled: true,
      builder: (modalContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8, // Fixed height: 80% of screen
          child: NewPost(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: ClothingSearchDelegate(
                ['Shirts', 'Pants', 'Shoes', 'Hats', 'Jackets'],
              ),
            );
          },
          icon: Icon(Icons.search), // Search icon on the left
        ),
        title: Text('Explore'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, // Action for "add" button
            icon: const Icon(Icons.add),
          ),
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