import 'package:flutter/foundation.dart';
import 'package:fitview_app/model/post_model.dart';
import 'package:fitview_app/data/post_data.dart';

class PostState extends ChangeNotifier {
  final List<Post> _posts = List.from(dummyPosts);

  // Getting Posts
  List<Post> get posts => List.unmodifiable(_posts);

  // Adding Post
  void addPost(Post post) {
    _posts.add(post);
    print("Total Posts: ${_posts.length}");
    notifyListeners(); // Notify listeners about the change
  }

  // Removing Post
  void removePost(Post post) {
    _posts.insert(0, post);
    notifyListeners(); // Notify listeners about the change
  }

  // Updating post
  void updatePost(String id, Post updatedPost) {
    final postIndex = _posts.indexWhere((post) => post.id == id);
    if (postIndex != -1) {
      _posts[postIndex] = updatedPost;
      notifyListeners(); // Notify listeners about the change
    }
  }
}
