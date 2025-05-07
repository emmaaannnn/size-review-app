import 'package:flutter/material.dart';
import 'package:fitview_app/model/user_model.dart';

class UserWidget extends StatefulWidget {
  final User currentUser;

  const UserWidget({super.key, required this.currentUser});
  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.currentUser.username), // Displaying the current user's name
    );
  }


}
