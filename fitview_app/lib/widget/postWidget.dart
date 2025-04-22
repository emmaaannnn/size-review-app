import 'package:fitview_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fitview_app/model/post_model.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          
          Image.network(
            post.photoUrl,
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Sizes: ${post.clothingSizes.join(", ")}'),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Height: ${post.userHeight} cm',
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Body Type: ${post.bodyType.displayName}',
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Expected Fit: ${post.expectedFit.displayName}',
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Actual Fit: ${post.actualFit.displayName}',
            ),
          ),
        ],
      ),
    );
  }
}
