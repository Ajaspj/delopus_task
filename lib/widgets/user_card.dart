import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profileImage),
        onBackgroundImageError: (_, __) => const Icon(Icons.person),
      ),
      title: Text(user.username,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(user.location),
    );
  }
}
