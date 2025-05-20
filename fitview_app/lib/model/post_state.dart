import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
