import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_provider.dart';

class DynamicSearchScreen extends StatefulWidget {
  const DynamicSearchScreen({super.key});

  @override
  DynamicSearchScreenState createState() => DynamicSearchScreenState();
}

class DynamicSearchScreenState extends State<DynamicSearchScreen> {
  late TextEditingController searchController;
  bool _isSearchActive = false;
  String _lastQuery = "";

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(172, 172, 182, 1),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                autofocus: true,
                onChanged: (query) {
                  setState(() {
                    _isSearchActive = query.isNotEmpty;
                    _lastQuery = query;
                  });
                  searchProvider.fetchSearchResults(query);
                },
                decoration: const InputDecoration(
                  hintText: "Search by username...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[300],
        elevation: 1,
      ),
      body: Builder(
        builder: (context) {
          if (searchProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (searchProvider.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                searchProvider.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          } else if (searchProvider.searchResults.isNotEmpty &&
              _isSearchActive &&
              _lastQuery == searchController.text) {
            return ListView.builder(
              itemCount: searchProvider.searchResults.length,
              itemBuilder: (context, index) {
                final user = searchProvider.searchResults[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: user.profileImageUrl.isNotEmpty
                        ? NetworkImage(user.profileImageUrl)
                        : null,
                    child: user.profileImageUrl.isEmpty
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  title: Text(user.username),
                  subtitle: Text(
                      user.email.isNotEmpty ? user.email : 'Unknown email'),
                );
              },
            );
          } else if (searchController.text.isNotEmpty && !_isSearchActive) {
            return const Center(
              child: Text(
                "No results found",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Start typing to search",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }
        },
      ),
    );
  }
}
