import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitview_app/model/post_model.dart';
import 'package:fitview_app/model/user_model.dart';
import 'package:fitview_app/states/postState.dart';
import 'package:fitview_app/states/userState.dart';

class NewPost extends StatefulWidget {
  @override
  State<NewPost> createState() => _NewPostState();
}


class _NewPostState extends State<NewPost> {
  String? _selectedImageUrl;
  String _enteredDescription = "";
  ClothingType? _selectedClothingType;
  ClothingSize? _selectedClothingSize;
  Fit? _expectedFit;
  Fit? _actualFit;


  void _handleDescriptionChange(String text) {
    setState(() {
      _enteredDescription = text;
    });
  }


  @override
  Widget build(BuildContext context) {
    // Retrieve logged-in user from UserState
    UserState userState = Provider.of<UserState>(context);
    User? currentUser = userState.currentUser;

    return Padding(
      padding: EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          // Image Selection Button
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
            ),
            width: MediaQuery.of(context).size.width/2,
            height: 450/2,
            alignment: Alignment.center,
            child: _selectedImageUrl == null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedImageUrl = 'lib/data/test5.jpg'; // Assign default image
                      });
                    },
                    icon: Icon(Icons.add_a_photo, size: 40),
                  )
                : Image.asset(
                      _selectedImageUrl!,
                      width: MediaQuery.of(context).size.width/2,
                      height: 450/2,
                      fit: BoxFit.cover,
                  ),
          ),

          SizedBox(height: 10),

          // Description Field
          TextField(
            onChanged: _handleDescriptionChange,
            maxLines: 5, // Allows the field to expand up to 5 lines
            decoration: InputDecoration(
              labelText: 'Post Description',
              border: OutlineInputBorder(), // Adds a border around the field
            ),
          ),

          SizedBox(height: 10),

          // Clothing Type Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust as needed
            children: [
              // Clothing Type Selection
              Expanded(
                child: DropdownButton<ClothingType>(
                  hint: Text("Select Clothing Type"),
                  value: _selectedClothingType,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedClothingType = newValue;
                    });
                  },
                  items: ClothingType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    );
                  }).toList(),
                ),
              ),
              
              SizedBox(width: 16), // Adds some spacing between dropdowns
              
              // Clothing Size Selection
              if (_selectedClothingType != null)
                Expanded(
                  child: DropdownButton<ClothingSize>(
                    hint: Text("Select Clothing Size"),
                    value: _selectedClothingSize,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedClothingSize = newValue;
                      });
                    },
                    items: ClothingSize.values.map((size) {
                      return DropdownMenuItem(
                        value: size,
                        child: Text(size.displayName),
                      );
                    }).toList(),
                  ),
                ),
            ],
          ),


          SizedBox(height: 10),

          // Expected Fit SelectionR
          SizedBox(
            width: double.infinity, // Makes it take the full screen width
            child: DropdownButton<Fit>(
              hint: Text("Select Expected Fit"),
              value: _expectedFit,
              onChanged: (newValue) {
                setState(() {
                  _expectedFit = newValue;
                });
              },
              items: Fit.values.map((fit) {
                return DropdownMenuItem(
                  value: fit,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(fit.displayName)),
                );
              }).toList(),
            ),
          ),


          SizedBox(height: 10),

          
          // Actual Fit Selection
          SizedBox(
            width: double.infinity, // Makes it take the full screen width
            child: DropdownButton<Fit>(
              hint: Text("Select Actual Fit"),
              value: _actualFit,
              onChanged: (newValue) {
                setState(() {
                  _actualFit = newValue;
                });
              },
              items: Fit.values.map((fit) {
                return DropdownMenuItem(
                  value: fit,
                  child: Text(fit.displayName),
                );
              }).toList(),
            ),
          ),


          SizedBox(height: 10),


          // Submit Button
          ElevatedButton(
            onPressed: () {
              if (_selectedImageUrl == null ||
                  _selectedClothingType == null ||
                  _selectedClothingSize == null ||
                  _expectedFit == null ||
                  _actualFit == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please fill out all required fields!")),
                );
                return;
              }

              Post newPost = Post(
                id: DateTime.now().toString(),
                username: currentUser!.username,
                photoUrl: _selectedImageUrl!,
                clothingItems: [
                  ClothingItem(
                    type: _selectedClothingType!,
                    size: _selectedClothingSize!,
                  ),
                ],
                userHeight: currentUser.height,
                bodyType: currentUser.bodyType,
                expectedFit: _expectedFit!,
                actualFit: _actualFit!,
                createdAt: DateTime.now(),
                description: _enteredDescription.isNotEmpty ? _enteredDescription : null,
              );

              // Add post using PostState
              Provider.of<PostState>(context, listen: false).addPost(newPost);

              Navigator.pop(context); // Close modal after submission
            },
            child: Text("Create Post"),
          ),
        ],
      ),
    );
  }

}