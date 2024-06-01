import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<String> names = [
    "salam",
    "wassem",
    "osama",
    'hamada',
    'alaa',
  ];
  List<String> filternames = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text("You don't have data yet...",style: TextStyle(
      fontSize: 20
    ),));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              showResults(context);
            },
            child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    names[index],
                    style: const TextStyle(fontSize: 15),
                  ),
                )),
          );
        },
      );
    } else {
      filternames = names
          .where((element) => element.contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: filternames.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              showResults(context);
            },
            child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    filternames[index],
                    style: const TextStyle(fontSize: 15),
                  ),
                )),
          );
        },
      );
    }
  }
}
