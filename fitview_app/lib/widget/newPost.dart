import 'package:flutter/material.dart';
import 'package:fitview_app/model/post_model.dart';

class NewPost extends StatefulWidget {
  State<NewPost> createState() {
    return _NewPostState();
  }
}

class _NewPostState extends State<NewPost> {
  var _enteredTitle = ' ';

  void _handleTitleEntry(String inputText) {
    _enteredTitle = inputText;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          // Expense title input field
          TextField(
            onChanged: _handleTitleEntry,
            maxLength: 40,
            decoration: InputDecoration(label: Text('Expense Title')),
          ),

          TextField(
            onChanged: _handleTitleEntry,
            maxLength: 40,
            decoration: InputDecoration(label: Text('HELLO')),
          ),

          TextField(
            onChanged: _handleTitleEntry,
            maxLength: 40,
            decoration: InputDecoration(label: Text('NO')),
          ),
        ],
      ),
    );
  }
}