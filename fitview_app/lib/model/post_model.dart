import 'user_model.dart';

class Post {
  final String username;
  final String photoUrl; 
  final List<String> clothingSizes; 
  final double userHeight; 
  final BodyType bodyType; 
  final Fit expectedFit;
  final Fit actualFit; 

  Post({
    required this.username,
    required this.photoUrl,
    required this.clothingSizes,
    required this.userHeight,
    required this.bodyType,
    required this.expectedFit,
    required this.actualFit,
  });

}

