import 'user_model.dart';

class Post {
  final String id; // Unique ID for the post
  final String username;
  final String photoUrl; 
  final List<String> clothingSizes; 
  final double userHeight; 
  final BodyType bodyType; 
  final Fit expectedFit;
  final Fit actualFit; 
  final DateTime createdAt; // Timestamp of post creation


  Post({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.clothingSizes,
    required this.userHeight,
    required this.bodyType,
    required this.expectedFit,
    required this.actualFit,
    required this.createdAt,
  });

}

