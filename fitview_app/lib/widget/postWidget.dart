import 'package:fitview_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fitview_app/model/post_model.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.username,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ),
          
          // Image that was selected for the post
          Image.asset(
            widget.post.photoUrl,
            width: MediaQuery.of(context).size.width,
            height: 450.0,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 10),


          // Displaying the clothing type and the size
          Row(
            children: [
              Text(
                'Sizes: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style, 
                  children: widget.post.clothingItems.map((item) => TextSpan(
                    text: '${item.type.displayName} ',
                    children: [
                      TextSpan(
                        text: '(${item.size.displayName})',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )).toList(),
                ),
              )
            ],
          ),

          // Displaying User Height
          Row(
            children: [
              Text(
                'Height: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${widget.post.userHeight} cm'),
            ],
          ),

          // Displaying User Body Type
          Row(
            children: [
              Text(
                'Body Type: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.post.bodyType.displayName),
            ],
          ),

          // Displaying Expected fit of clothing
          Row(
            children: [
              Text(
                'Expected Fit: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.post.expectedFit.displayName),
            ],
          ),

          // Displaying Actual fit of clothing
          Row(
            children: [
              Text(
                'Actual Fit: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.post.actualFit.displayName),
            ],
          ),

          // Displaying the description of the post if the button is pressed
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.post.description ?? 'No description available.',
                style: TextStyle(fontSize: 14.0),
              ),
            ),

          // Button to show or hide the description
           Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? 'Hide Details' : 'Show More Details'),
            ),
          ),
        ],
      ),
    );
  }


}
