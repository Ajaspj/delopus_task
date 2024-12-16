import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class SearchProvider with ChangeNotifier {
  List<UserModel> _allUsers = [];
  List<UserModel> _searchResults = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<UserModel> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
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
        _allUsers = data.map((user) => UserModel.fromJson(user)).toList();

        _searchResults = _allUsers
            .where((user) =>
                user.username.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

        if (_searchResults.isEmpty) {
          _errorMessage = 'No results found for "$query"';
        }
      } else {
        _errorMessage = 'Error: ${response.statusCode}';
        _searchResults = [];
      }
    } catch (error) {
      _errorMessage = 'An error occurred: $error';
      _searchResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearSearchResults() {
    _searchResults = [];
    _errorMessage = "";
    notifyListeners();
  }
}
