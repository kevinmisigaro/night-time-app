class User {
  final String uid;
  final String displayName;

  User({this.uid, this.displayName});
}

class UserClubFavorites {
  final String clubId;
  final String userId;
  final int alcoholPrice;
  final String location;
  final String name;
  final String type;
  final List likes;
  
  UserClubFavorites({this.clubId, this.userId, this.alcoholPrice, 
  this.location, this.type, this.name, this.likes});
}
