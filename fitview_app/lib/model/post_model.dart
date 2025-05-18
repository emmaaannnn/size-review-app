import 'user_model.dart';
import 'dart:io';

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

  Map<String, dynamic> toMap() {
    return {
      'type': type.toString(),
      'size': size.toString(),
    };
  }

  static ClothingItem fromMap(Map<String, dynamic> map) {
    return ClothingItem(
      type: ClothingType.values.firstWhere((e) => e.toString() == map['type']),
      size: ClothingSize.values.firstWhere((e) => e.toString() == map['size']),
    );
  }

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
    this.description,
  });

  // Convert the stored string path into a File when needed
  File getPhotoFile() {
    return File(photoUrl); // Turns the string into a usable File
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'photoUrl': photoUrl,
      'clothingItems': clothingItems.map((item) => item.toMap()).toList(),
      'userHeight': userHeight,
      'bodyType': bodyType.toString(),
      'expectedFit': expectedFit.toString(),
      'actualFit': actualFit.toString(),
      'description': description ?? "", // Store empty string if null
    };
  }

  // converting data from firestore to Post data
  static Post fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      username: map['username'],
      photoUrl: map['photoUrl'],
      clothingItems: (map['clothingItems'] as List)
          .map((item) => ClothingItem.fromMap(item))
          .toList(),
      userHeight: map['userHeight'],
      bodyType: BodyType.values.firstWhere((e) => e.toString() == map['bodyType']),
      expectedFit: Fit.values.firstWhere((e) => e.toString() == map['expectedFit']),
      actualFit: Fit.values.firstWhere((e) => e.toString() == map['actualFit']),
      description: map['description'] ?? "",
    );
  }
}

