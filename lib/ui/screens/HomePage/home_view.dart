import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/chart_data.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/colored_dots.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/drawer_home.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerHome(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              _circularchartContainer(),
              _columnchartCountainer()
            ]),
          ),
        ));
  }
  Row _circularchartContainer() {
    return Row(
      children: [
        SizedBox(
            width: 300,
            child: CircularChart(
              data: [
                chartdata(value: 10, name: 'material'),
                chartdata(value: 25, name: 'exports'),
                chartdata(value: 37, name: 'imports'),
              ],
            )),
        const ColoredDotsList(),
      ],
    );
  }

  Container _columnchartCountainer() {
    return Container(
        padding: const EdgeInsets.only(left: 18, right: 18),
        color: Colors.white,
        child: const ColumnChart());
  }

}
