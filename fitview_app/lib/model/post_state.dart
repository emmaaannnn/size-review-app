import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:fitview_app/model/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostState extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => List.unmodifiable(_posts); // Getter for posts

  // Fetch posts from Firestore
  Future<void> fetchPosts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('posts').get();

      _posts = snapshot.docs.map((doc) => Post.fromMap(doc.data())).toList();
      notifyListeners();
    } catch (e) {
      print("❌ Error fetching posts: $e");
    }
  }

  // Adding Post
  Future<void> addPost(Post post) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(post.id).set(post.toMap());
      _posts.add(post);
      notifyListeners();
    } catch (e) {
      print("❌ Error adding post: $e");
    }
  }

  // Uploading Image
  Future<void> uploadImage(File imageFile) async {
    String fileName = "uploads/${DateTime.now().millisecondsSinceEpoch}.jpg";
    Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

    UploadTask uploadTask = storageRef.putFile(imageFile);
    await uploadTask;

    String downloadURL = await storageRef.getDownloadURL();
    print("✅ Image uploaded successfully! URL: $downloadURL");
  }


  // Removing Post
  Future<void> removePost(Post post) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(post.id).delete();
      _posts.remove(post);
      notifyListeners();
    } catch (e) {
      print("❌ Error removing post: $e");
    }
  }
}
