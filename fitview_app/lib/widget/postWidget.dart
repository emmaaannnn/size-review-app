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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.username,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ),
          
          Image.asset(
            post.photoUrl,
            width: MediaQuery.of(context).size.width,
            height: 450.0,
            fit: BoxFit.cover,
          ),

          Row(
            children: [
              Text(
                'Sizes: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(post.clothingItems.join(", ")),
            ],
          ),

          Row(
            children: [
              Text(
                'Height: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${post.userHeight} cm'),
            ],
          ),
          Row(
            children: [
              Text(
                'Body Type: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(post.bodyType.displayName),
            ],
          ),
          Row(
            children: [
              Text(
                'Expected Fit: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(post.expectedFit.displayName),
            ],
          ),
          Row(
            children: [
              Text(
                'Actual Fit: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(post.actualFit.displayName),
            ],
          ),

           Center(
            child: ElevatedButton(
              onPressed: () {
                _showDescription(context, post.description);
              },
              child: Text('Show More Details'),
            ),
          ),
        ],
      ),
    );
  }

  void _showDescription(BuildContext context, String? description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Description'),
          content: Text(description ?? 'No description available.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

}
