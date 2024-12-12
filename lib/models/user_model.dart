class UserModel {
  final String username;
  final String email;
  final String profileImageUrl;

  UserModel({
    required this.username,
    required this.email,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? 'Unknown',
      email: json['email'] ?? 'No email',
      profileImageUrl: json['profile_image'] ?? '',
    );
  }
}
