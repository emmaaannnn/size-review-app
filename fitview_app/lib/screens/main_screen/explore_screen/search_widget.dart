import 'package:flutter/material.dart';

class ClothingSearchDelegate extends SearchDelegate {
  final List<String> clothingItems; // List of items to search through

  ClothingSearchDelegate(this.clothingItems);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the AppBar (e.g., clear search text)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search bar text
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Leading widget (e.g., back button)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Display the search results
    final results = clothingItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]); // Close and return selected item
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Display search suggestions as the user types
    final suggestions = clothingItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index]; // Update search query
            showResults(context); // Show results for selected suggestion
          },
        );
      },
    );
  }
}