import 'package:flutter/material.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/chart_data.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/colored_dots.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/drawer_home.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: const DrawerHome(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: width,
            height: height,
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),

              Container(
                decoration:  const BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

                ),
                  child: _circularchartContainer(width,height)),
              _columnchartCountainer(width,height)
            ]),
          ),
        ));
  }
  Row _circularchartContainer(double width, double height) {
    return Row(
      children: [
        Container(
          height: height * 0.38,
            width: width *0.72,
            child: CircularChart(
              data: [
                chartdata(value: 10, name: 'material', color: Colors.black54),

                chartdata(value: 20, name: 'exports',color:Colors.black38),
                chartdata(value: 20, name: 'imports',color:Colors.red.shade400),
              ],
            )),
        const ColoredDotsList(),
      ],
    );
  }

  Container _columnchartCountainer(double width, double height) {
    return Container(
      height: height *0.4,
        padding: EdgeInsets.only(left: width*0.04  , right: width*0.04),
        color: Colors.white10,
        child: const ColumnChart());
  }

}
