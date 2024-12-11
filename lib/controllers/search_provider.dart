import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class SearchProvider with ChangeNotifier {
  List<UserModel> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      _users = [];
      _errorMessage = '';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.delopus.com/user/userprofile/find-user/?search=$query',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        _users = data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        _errorMessage = 'Error: ${response.statusCode}';
        _users = [];
      }
    } catch (error) {
      _errorMessage = 'An error occurred: $error';
      _users = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
