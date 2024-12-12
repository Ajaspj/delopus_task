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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                autofocus: true,
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    searchProvider.fetchSuggestions(query);
                  } else {
                    searchProvider.clearSuggestions();
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Search by username...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                searchProvider.fetchSearchResults(searchController.text);
              },
            ),
          ],
        ),
        backgroundColor: Colors.grey[300],
        elevation: 1,
      ),
      body: Builder(
        builder: (context) {
          if (searchProvider.isLoading) {
            // Show loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (searchProvider.errorMessage.isNotEmpty) {
            // Show error message
            return Center(
              child: Text(
                searchProvider.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          } else if (searchProvider.searchResults.isNotEmpty) {
            // Show search results
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
          } else if (searchProvider.suggestions.isNotEmpty) {
            // Show suggestions
            return ListView.builder(
              itemCount: searchProvider.suggestions.length,
              itemBuilder: (context, index) {
                final user = searchProvider.suggestions[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(
                      user.email.isNotEmpty ? user.email : 'Unknown email'),
                  onTap: () {
                    searchController.text = user.username;
                    searchProvider.fetchSearchResults(user.username);
                  },
                );
              },
            );
          } else if (searchController.text.isNotEmpty) {
            // Show no results message
            return const Center(
              child: Text(
                "No results found",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          } else {
            // Default state when nothing is searched
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
