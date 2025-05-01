
enum BodyType {
  slim,
  athletic,
  average,
  muscular,
  plusSize,
  petite,
  curvy,
}

extension BodyTypeExtension on BodyType {
  String get displayName {
    switch (this) {
      case BodyType.slim:
        return 'Slim';
      case BodyType.athletic:
        return 'Athletic';
      case BodyType.average:
        return 'Average';
      case BodyType.muscular:
        return 'Mascular';
      case BodyType.plusSize:
        return 'Plus Size';
      case BodyType.petite:
        return 'Petite';
      case BodyType.curvy:
        return 'Curvy';  
    }
  }
}

enum Fit {
  slim,
  oversized,
  baggyOversized,
  straight,
  regular,
  tight,
  extraTight,
}

extension FitExtension on Fit {
  String get displayName {
    switch (this) {
      case Fit.slim:
        return 'Slim';
      case Fit.oversized:
        return 'Oversized';
      case Fit.baggyOversized:
        return 'Baggy Oversized';
      case Fit.straight:
        return 'Straight';
      case Fit.regular:
        return 'Regular';
      case Fit.tight:
        return 'Tight';
      case Fit.extraTight:
        return 'Extra Tight';
    }
  }
}


class User {
  final String username;
  final String name;
  final String bio;
  final double height;
  final BodyType bodyType;
  final Fit preferredFit;


  User(
    {
      required this.username, 
      required this.name, 
      required this.bio,
      required this.height,
      required this.bodyType,
      required this.preferredFit,
      }
  );
}


