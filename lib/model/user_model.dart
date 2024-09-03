class UserModel {
  String fName;
  String lName;
  String profilePic;
  String createAt;
  String phoneNumber;
  String bio;
  String uid;

  UserModel({
    required this.fName,
    required this.lName,
    required this.profilePic,
    required this.createAt,
    required this.phoneNumber,
    required this.bio,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fName: map['fName'] ?? '',
      lName: map['lName'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createAt: map['createAt'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      bio: map['bio'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "fName": fName,
      "lName": lName,
      "profilePic": profilePic,
      "createAt": createAt,
      "phoneNumber": phoneNumber,
      "bio": bio,
      "uid": uid,
    };
  }
}
