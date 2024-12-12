import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class SearchProvider with ChangeNotifier {
  List<UserModel> _suggestions = [];
  List<UserModel> _searchResults = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<UserModel> get suggestions => _suggestions;
  List<UserModel> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) {
      clearSuggestions();
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.delopus.com/user/userprofile/find-user/?search=$query',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['results'];
        _suggestions = data.map((user) => UserModel.fromJson(user)).toList();
      } else {
        clearSuggestions();
      }
    } catch (error) {
      clearSuggestions();
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      _errorMessage = 'Search query cannot be empty';
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
        _searchResults = data.map((user) => UserModel.fromJson(user)).toList();
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

  void clearSuggestions() {
    _suggestions = [];
    notifyListeners();
  }
}
