import 'package:flutter/material.dart';

class SearchScreen extends SearchDelegate {
  List<String> searchTerms = [
    'Bi mat Phan Thien An',
    'Con duoc la chinh minh',
    'Cay cam ngot cua toi',
    'Hanh tinh cua mot ke nghi nhieu',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
    // return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toUpperCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var books in searchTerms) {
      if (books.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(books);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
