import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../new_post.dart';
import 'search_widget.dart';
import 'post_widget.dart';

import 'package:fitview_app/model/post_state.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() {
    return _Explore();
  }
}

class _Explore extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchPosts()); // Fetch posts when screen initializes
  }

  void _fetchPosts() {
    Provider.of<PostState>(context, listen: false).fetchPosts();
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      builder: (modalContext) {
        return SizedBox(
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
      body: Consumer<PostState>(
        builder: (context, postState, child) {
          return ListView.builder(
            itemCount: postState.posts.length,
            itemBuilder: (context, index) {
              return PostWidget(post: postState.posts.reversed.toList()[index]);
            },
          );
        },
      ),
    );
  }
}