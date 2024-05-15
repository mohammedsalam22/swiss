import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/colored_dots.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.dehaze_outlined,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(width: 310, child: CircularChart()),
                  ColoredDotsList(),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  color: Colors.white,
                  child: const ColumnChart())
            ]),
          ),
        ));
  }
}
