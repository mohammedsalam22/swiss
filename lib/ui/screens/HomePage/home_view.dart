import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_buttons.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/export_card.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';

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
        appBar: buildAppBar(),
        // drawer: const DrawerHome(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade50,
            width: width,
            height: height,
            child: Column(children: [
              buildIconButtons(context),
              const Divider(
                thickness: 0.2,
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Overview',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      'Month',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Divider(
                thickness: 0.2,
              ),
              const SizedBox(
                height: 10,
              ),
              _columnchartCountainer(width, height),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExportCard(title: '  Total Exports', value: '25%'),
                  ExportCard(title: '  Total Imports', value: '75%'),
                ],
              ),
            ]),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
        title: const Center(
            child: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w500),
        )),
      );
  }

  Container buildIconButtons(BuildContext context) {
    return Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularButton(
                    icon: Icons.receipt_long,
                    label: 'Report',
                    onPressed: () {},
                    color: Colors.purple.shade50,
                    bordercolor: Colors.deepPurpleAccent,
                  ),
                  CircularButton(
                    icon: Icons.analytics,
                    label: 'Analytics',
                    onPressed: () {},
                    color: Colors.orange.shade50,
                    bordercolor: Colors.orange,
                  ),
                  CircularButton(
                    icon: Ionicons.notifications,
                    label: 'Notifications',
                    onPressed: () {},
                    color: Colors.indigo.shade50,
                    bordercolor: Colors.indigo.shade600,
                  ),
                  CircularButton(
                    icon: Ionicons.search,
                    label: 'Search',
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    color: Colors.red.shade50,
                    bordercolor: Colors.red,
                  ),
                ],
              ),
            );
  }

  Container _columnchartCountainer(double width, double height) {
    return Container(
        height: height * 0.35,
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        color: Colors.white10,
        child: const ColumnChart());
  }
}
// Row _circularchartContainer(double width, double height) {
//   return Row(
//     children: [
//       Container(
//           height: height * 0.38,
//           width: width * 0.72,
//           child: CircularChart(
//             data: [
//               chartdata(value: 10, name: 'material', color: Colors.black54),
//               chartdata(value: 20, name: 'exports', color: Colors.black38),
//               chartdata(
//                   value: 20, name: 'imports', color: Colors.red.shade400),
//             ],
//           )),
//       const ColoredDotsList(),
//     ],
//   );
// }