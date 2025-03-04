import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';
import '../../MaterialPage/details_page.dart';

class CustomSearch extends SearchDelegate {
  List<String> names = [
    "salam",
    "wassem",
    "osama",
    'hamada',
    'alaa',
  ];
  List<String> filteredNames = [];

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
    return Result(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filteredNames = query.isEmpty
        ? []
        : names.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: filteredNames.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  query = filteredNames[index]; // Set the query to the selected name
                  showResults(context); // Show results for the selected name
                },
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      filteredNames[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (query.isNotEmpty) {
              showResults(context); // Trigger search results
            }
          },
          child: const Text("Search"),
        ),
      ],
    );
  }
}

class Result extends StatefulWidget {
  const Result({super.key, required this.query});

  final String query;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<InventoryCubit>(context, listen: false)
          .search(widget.query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        if (state.status == InventoryStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (BlocProvider.of<InventoryCubit>(context).search1 == null) {
          return const Center(child: Text("No results found."));
        }
        var results = BlocProvider.of<InventoryCubit>(context).search1['data'];
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Card(
                surfaceTintColor: Colors.white,
                shadowColor: Colors.black45,
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                elevation: 7,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, right: 0, left: 0, bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/img_1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                results[index]['searchable']['name']['en'],
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  results[index]['searchable']['quantity']
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text(
                                'Source ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17),
                              ),
                              Text(
                                '', // You can customize this based on your data
                                style: TextStyle(
                                    color: Colors.red, fontSize: 17),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Details(
                              id: results[index]['searchable']['id'],
                            ),
                          ));
                        },
                        icon: const Icon(
                          CupertinoIcons.info,
                          color: Colors.red,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}