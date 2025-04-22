import 'package:fitview_app/model/post_model.dart';
import 'package:fitview_app/model/user_model.dart';

List<Post> dummyPosts = [
  Post(
    id: '1',
    username: 'FashionGuru',
    photoUrl: 'fitview_app/data/test1.jpg',
    clothingSizes: ['M'],
    userHeight: 165.0,
    bodyType: BodyType.slim,
    expectedFit: Fit.oversized,
    actualFit: Fit.straight,
    createdAt: DateTime.now(),
  ),
  Post(
    id: '2',
    username: 'StyleStar',
    photoUrl: 'https://via.placeholder.com/150',
    clothingSizes: ['S', 'XS'],
    userHeight: 155.0,
    bodyType: BodyType.athletic,
    expectedFit: Fit.tight,
    actualFit: Fit.regular,
    createdAt: DateTime.now(),
  ),
  Post(
    id: '3',
    username: 'ChicFashionista',
    photoUrl: 'https://via.placeholder.com/150',
    clothingSizes: ['L'],
    userHeight: 170.0,
    bodyType: BodyType.curvy,
    expectedFit: Fit.baggyOversized,
    actualFit: Fit.oversized,
    createdAt: DateTime.now(),
  ),
  Post(
    id: '4',
    username: 'TrendyVibes',
    photoUrl: 'https://via.placeholder.com/150',
    clothingSizes: ['M', 'L'],
    userHeight: 180.0,
    bodyType: BodyType.athletic,
    expectedFit: Fit.slim,
    actualFit: Fit.extraTight,
    createdAt: DateTime.now(),
  ),
];