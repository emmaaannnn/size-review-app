
enum BodyType {
  slim,
  athletic,
  average,
  muscular,
  plusSize,
}

enum Fit {
  slim,
  oversized,
  straight,
  regular,
  tight,
  extraTight,
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


