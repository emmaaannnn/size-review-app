import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:fitview_app/model/post_model.dart';
import 'package:fitview_app/model/user_model.dart';

class NewPost extends StatefulWidget {
  State<NewPost> createState() {
    return _NewPostState();
  }
}

class _NewPostState extends State<NewPost> {
  //vXFile? _selectedImage;
  //final ImagePicker _picker = ImagePicker();
  String _enteredDescription = "";
  ClothingType? _selectedClothingType;
  ClothingSize? _selectedClothingSize;
  Fit? _expectedFit;
  Fit? _actualFit;

  // Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _selectedImage = image;
  //   });
  // }

  void _handleDescriptionChange(String text) {
    setState(() {
      _enteredDescription = text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          // Image Selection Button

          // ElevatedButton(
          //   onPressed: _pickImage,
          //   child: Text("Select Photo"),
          // ),
          // if (_selectedImage != null)
          //   Image.file(
          //     File(_selectedImage!.path),
          //     height: 150,
          //     width: 150,
          //     fit: BoxFit.cover,
          //   ),

          // Description Field
          TextField(
            onChanged: _handleDescriptionChange,
            maxLength: 100,
            decoration: InputDecoration(labelText: 'Post Description'),
          ),

          // Clothing Type Selection
          DropdownButton<ClothingType>(
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

          // Clothing Size Selection
          if (_selectedClothingType != null)
            DropdownButton<ClothingSize>(
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

          // Expected Fit Selection
          DropdownButton<Fit>(
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
                child: Text(fit.displayName),
              );
            }).toList(),
          ),

          // Actual Fit Selection
          DropdownButton<Fit>(
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

          // Submit Button
          ElevatedButton(
            onPressed: () {
              if (//_selectedImage != null &&
                  _enteredDescription.isNotEmpty &&
                  _selectedClothingType != null &&
                  _selectedClothingSize != null &&
                  _expectedFit != null &&
                  _actualFit != null) {
                Post newPost = Post(
                  id: DateTime.now().toString(),
                  username: "CurrentUser", // You can replace this dynamically
                  photoUrl: 'lib/data/test3.jpg',
                  clothingItems: [
                    ClothingItem(
                      type: _selectedClothingType!,
                      size: _selectedClothingSize!,
                    ),
                  ],
                  userHeight: 170.0, // Replace with actual user data
                  bodyType: BodyType.average, // Replace with user data
                  expectedFit: _expectedFit!,
                  actualFit: _actualFit!,
                  createdAt: DateTime.now(),
                  description: _enteredDescription,
                );

                print("New post created: ${newPost.description}");
              }
            },
            child: Text("Create Post"),
          ),
        ],
      ),
    );
  }
}