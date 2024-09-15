import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swis_warehouse/bloc/Home/home_cubit.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/circular_buttons.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/export_card.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';
import 'package:swis_warehouse/ui/screens/Inventory/inventory_view.dart';
import 'package:swis_warehouse/ui/screens/Inventory/postdate.dart';

import '../../../bloc/donorhome/donor_home_cubit.dart';
import '../Report/report_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override

  void initState() {

    if (true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await BlocProvider.of<HomeCubit>(context, listen: false).home();
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<DonorHomeCubit>(context, listen: false).home();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        appBar: buildAppBar(),
        // drawer: const DrawerHome(),
        body: (true)
            ? SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (BlocProvider
                  .of<HomeCubit>(context)
                  .home1 == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              var home =
              BlocProvider
                  .of<HomeCubit>(context)
                  .home1['data'];
              return Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          home['name'] ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          home['code'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
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
                  _columnchartCountainer(
                      width, height, home['items'], 'name', 'quantity'),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExportCard(
                          title: 'Free capacity',
                          value: home['Free_capacity'].toString()),
                      ExportCard(
                          title: home['main_Warehouse']['name'] ?? "",
                          value: home['branch']['name'] ?? ""),
                    ],
                  ),
                ]),
              );
            },
          ),
        )
            : SingleChildScrollView(
          child: BlocBuilder<DonorHomeCubit, DonorHomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              if (BlocProvider
                  .of<HomeCubit>(context)
                  .home1 == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              var home =
              BlocProvider
                  .of<HomeCubit>(context)
                  .home1['data'];
              return Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          home['name'] ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          home['code'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
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
                  _columnchartCountainer(
                      width, height, home['items'], 'name', 'quantity'),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExportCard(
                          title: 'Free capacity',
                          value: home['Free_capacity'].toString()),
                      ExportCard(
                          title: home['main_Warehouse']['name'] ?? "",
                          value: home['branch']['name'] ?? ""),
                    ],
                  ),
                ]),
              );
            },
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WarehouseReportPage()));
            },
            color: Colors.purple.shade50,
            bordercolor: Colors.deepPurpleAccent,
          ),
          CircularButton(
            icon: Icons.analytics,
            label: 'Analytics',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PostDate()));
            },
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

  Container _columnchartCountainer(double width, double height, List hh,
      String name, String quant) {
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
