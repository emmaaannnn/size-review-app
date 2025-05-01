import 'user_model.dart';

enum ClothingType {
  tshirt,
  longshirt,
  sweatshirt,
  singlet,
  jacket,
  hoodie,
  shorts,
  vest,
  dress,
  pants,
  skirt
}

extension ClothingTypeExtension on ClothingType {
  String get displayName {
    switch (this) {
      case ClothingType.tshirt:
        return 'T-Shirt';
      case ClothingType.longshirt:
        return 'Long Shirt';
      case ClothingType.sweatshirt:
        return 'Sweatshirt';
      case ClothingType.singlet:
        return 'Singlet';
      case ClothingType.jacket:
        return 'Jacket';
      case ClothingType.hoodie:
        return 'Hoodie';
      case ClothingType.shorts:
        return 'Shorts';
      case ClothingType.vest:
        return 'Vest';
      case ClothingType.dress:
        return 'Dress';
      case ClothingType.pants:
        return 'Pants';
      case ClothingType.skirt:
        return 'Skirt';
    }
  }
}

enum ClothingSize {
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  size28,
  size30,
  size32,
  size34,
  size36,
  size38,
  size40,
}

extension ClothingSizeExtension on ClothingSize {
  String get displayName {
    switch (this) {
      case ClothingSize.xs:
        return 'XS';
      case ClothingSize.s:
        return 'S';
      case ClothingSize.m:
        return 'M';
      case ClothingSize.l:
        return 'L';
      case ClothingSize.xl:
        return 'XL';
      case ClothingSize.xxl:
        return 'XXL';
      case ClothingSize.size28:
        return '28';
      case ClothingSize.size30:
        return '30';
      case ClothingSize.size32:
        return '32';
      case ClothingSize.size34:
        return '34';
      case ClothingSize.size36:
        return '36';
      case ClothingSize.size38:
        return '38';
      case ClothingSize.size40:
        return '40';
    }
  }
}
class ClothingItem {
  final ClothingType type;
  final ClothingSize size;

  ClothingItem({required this.type, required this.size});
}

class Post {
  final String id; // Unique ID for the post
  final String username;
  final String photoUrl; 
  final List<ClothingItem> clothingItems;
  final double userHeight; 
  final BodyType bodyType; 
  final Fit expectedFit;
  final Fit actualFit; 
  final DateTime createdAt; // Timestamp of post creation
  final String ? description; // Optional description of the post

  Post({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.clothingItems,
    required this.userHeight,
    required this.bodyType,
    required this.expectedFit,
    required this.actualFit,
    required this.createdAt,
    this.description,
  });

}

