import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_buttons.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';

import '../Report/report_view.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({
    super.key,
    required this.list,
  });

  final List list;

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
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
            const Divider(
              thickness: 0.2,
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
            _columnchartCountainer(
                width, height, widget.list, 'item_name', 'total_quantity_in'),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 240,
                    child: Card(
                      elevation: 2,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset(
                          'assets/img_1.png',
                          width: 100,
                        ),
                        title: const Text('salam'),
                        subtitle: const Row(
                          children: [
                            Text('10'),
                            SizedBox(width: 16),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        )));
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      elevation: 0,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey,
      title: const Center(
          child: Text(
        'Inventory',
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
    );
  }

  Container _columnchartCountainer(
      double width, double height, List hh, String name, String quant) {
    return Container(
        height: height * 0.35,
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        color: Colors.white10,
        child: ColumnChart(
          data: hh,
          name: name,
          quant: quant,
        ));
  }
}
