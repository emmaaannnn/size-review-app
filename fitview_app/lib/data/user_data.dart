import 'package:fitview_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<User> dummyUsers = [
  User(
    email: 'fashiong@gmail.com',
    username: 'FashionGuru',
    name: 'John Guru',
    bio: 'Fashion enthusiast and style advisor.',
    height: 165.0,
    bodyType: BodyType.slim,
    preferredFit: Fit.oversized,
  ),
  User(
    email: 'stylestar101@yahoo.com',
    username: 'StyleStar',
    name: 'Ricky Styler',
    bio: 'Always on the lookout for the latest trends.',
    height: 155.0,
    bodyType: BodyType.athletic,
    preferredFit: Fit.tight,
  ),
  User(
    email: 'chicfashion@gmail.com',
    username: 'ChicFashionista',
    name: 'Beth Chic',
    bio: 'Chic and trendy, always!',
    height: 170.0,
    bodyType: BodyType.curvy,
    preferredFit: Fit.baggyOversized,
  ),
  User(
    email: 'trendyguy@hotmail.com',
    username: 'TrendyVibes',
    name: 'Bob Trendy',
    bio: 'Trendy and stylish, always!',
    height: 180.0,
    bodyType: BodyType.athletic,
    preferredFit: Fit.oversized,
  ),
  User(
    email: 'test@test.com',
    username: 'TestUser',
    name: 'John Doe',
    bio: 'This is a test user.',
    height: 170.0,
    bodyType: BodyType.athletic,
    preferredFit: Fit.regular,
    //password: password123 - keep this user in firebase authentication
  ),
];

//adding users to firestore
Future<void> addDummyUsersToFirestore() async {
  for (User user in dummyUsers) {
    await FirebaseFirestore.instance.collection('users').doc(user.username).set({
      'email': user.email,
      'username': user.username,
      'name': user.name,
      'bio': user.bio,
      'height': user.height,
      'bodyType': user.bodyType.toString(),
      'preferredFit': user.preferredFit.toString(),
    });
  }
  print("Dummy users added successfully!");
}
