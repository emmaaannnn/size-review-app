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
      padding: EdgeInsets.all(16), // Adds spacing around the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spaces elements apart
          children: [
            // Left side (Username, Height, Body Type, Preferred Fit)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                Text("Height: ${widget.currentUser.height} cm"),
                Text("Body Type: ${widget.currentUser.bodyType}"),
                Text("Preferred Fit: ${widget.currentUser.preferredFit}"),
              ],
            ),

            // Right side (Name, Bio)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
              children: [
                Text(widget.currentUser.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.currentUser.bio),
              ],
            ),
          ],
        ),
      );
  }


}
