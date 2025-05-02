import 'package:fitview_app/model/post_model.dart';
import 'package:fitview_app/model/user_model.dart';

List<Post> dummyPosts = [
  Post(
    id: '1',
    username: 'FashionGuru',
    photoUrl: 'lib/data/test1.jpg',
    clothingItems: [
      ClothingItem(type: ClothingType.jacket, size: ClothingSize.m),
    ],
    userHeight: 165.0,
    bodyType: BodyType.slim,
    expectedFit: Fit.oversized,
    actualFit: Fit.straight,
    createdAt: DateTime.now(),
    description: 'Loving this oversized jacket!, Its got that crop look too so it fits me well and looks amazing!',
  ),
  Post(
    id: '2',
    username: 'StyleStar',
    photoUrl: 'lib/data/test2.jpg',
    clothingItems: [
      ClothingItem(type: ClothingType.sweatshirt, size: ClothingSize.s),
    ],
    userHeight: 155.0,
    bodyType: BodyType.athletic,
    expectedFit: Fit.tight,
    actualFit: Fit.regular,
    createdAt: DateTime.now(),
    description: 'This sweatshirt is perfect for my body type! It fits just right and is super comfy.',
  ),
  Post(
    id: '3',
    username: 'ChicFashionista',
    photoUrl: 'lib/data/test3.jpg',
    clothingItems: [
      ClothingItem(type: ClothingType.pants, size: ClothingSize.l),
    ],
    userHeight: 170.0,
    bodyType: BodyType.curvy,
    expectedFit: Fit.baggyOversized,
    actualFit: Fit.oversized,
    createdAt: DateTime.now(),
    description: 'These pants are a bit baggy but I love the oversized look!',
  ),
  Post(
    id: '4',
    username: 'TrendyVibes',
    photoUrl: 'lib/data/test4.jpg',
    clothingItems: [
      ClothingItem(type: ClothingType.tshirt, size: ClothingSize.m),
    ],
    userHeight: 180.0,
    bodyType: BodyType.athletic,
    expectedFit: Fit.oversized,
    actualFit: Fit.oversized,
    createdAt: DateTime.now(),
  ),
];