class UserModel {
  final String username;
  final String profileImage;
  final String location;

  UserModel({
    required this.username,
    required this.profileImage,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      profileImage: json['profile_image'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
