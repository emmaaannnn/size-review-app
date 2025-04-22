import 'package:flutter/material.dart';
import 'package:fitview_app/widget/postWidget.dart';
import 'package:fitview_app/data/post_data.dart';

class FollowingScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          return PostWidget(post: dummyPosts[index]);
        },
      ),
    );
    
  }
}
