import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/column_chart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/linechart.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/search_widget.dart';
import '../../../bloc/Home/home_cubit.dart';
import '../Inventory/postdate.dart';
import '../Report/report_view.dart';

class WarehouseView extends StatefulWidget {
  @override
  _WarehouseViewState createState() => _WarehouseViewState();
}

class _WarehouseViewState extends State<WarehouseView> {
  String selectedChartType = 'Column Chart'; // Default chart type
  final List<String> chartTypes = ['Column Chart', 'Line Chart'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<HomeCubit>(context, listen: false).home();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            if (BlocProvider.of<HomeCubit>(context).home1 == null) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            var home = BlocProvider.of<HomeCubit>(context).home1['data'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Warehouse Title
                SizedBox(height: 10),
                _buildWarehouseHeader(context),
                SizedBox(height: 16),

                // Search Widget
                _buildSearchBar(context), // Pass context to the search bar
                SizedBox(height: 16),

                // Row for Dropdown and Warehouse Code
                _buildWarehouseInfoRow(home),
                SizedBox(height: 16),

                // Chart Container
                _buildChartContainer(width, height, home['items'], 'name', 'quantity'),
                SizedBox(height: 16),

                // Inventory Section
                _buildInventorySection(),
                SizedBox(height: 16),

                // Summary Section
                _buildSummarySection(home),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  // Method to build the warehouse header
  Widget _buildWarehouseHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Warehouse",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        IconButton(
          color: Colors.black87,
          icon: Icon(Ionicons.receipt, size: 28),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WarehouseReportPage()));
          },
        ),
      ],
    );
  }

  // Method to build the search bar
  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearch(), // Show the custom search delegate
        );
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Search...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the warehouse info row with dropdown
  Widget _buildWarehouseInfoRow(Map<String, dynamic> home) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Warehouse Code Display
          Text(
            home['name'] ?? "",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          // Dropdown Button for Chart Type
          DropdownButton<String>(
            value: selectedChartType,
            onChanged: (String? newValue) {
              setState(() {
                selectedChartType = newValue!;
              });
            },
            items: chartTypes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Method to build the chart container based on selected chart type
  Widget _buildChartContainer(double width, double height, List data, String name, String quant) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: selectedChartType == 'Line Chart'
            ? _lineChartContainer(width, height, data, name, quant)
            : _columnchartCountainer(width, height, data, name, quant),
      ),
    );
  }

  Container _columnchartCountainer(double width, double height, List hh, String name, String quant) {
    return Container(
      height: height * 0.35,
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      color: Colors.white10,
      child: ColumnChart(
        data: hh,
        name: name,
        quant: quant,
      ),
    );
  }

  Container _lineChartContainer(double width, double height, List hh, String name, String quant) {
    return Container(
      height: height * 0.35,
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      color: Colors.white10,
      child: LineChart(
        data: hh,
        name: name,
        quant: quant,
      ),
    );
  }

  // Method to build the inventory section
  Widget _buildInventorySection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[800],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inventory",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Manage your inventory effectively to optimize your trading.",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PostDate()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xFF8B0000),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Manage Inventory"),
          ),
        ],
      ),
    );
  }

  // Method to build the summary section
  Widget _buildSummarySection(Map<String, dynamic> home) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildSummaryItem("Warehouse Code:", home['code']),
        _buildSummaryItem("Free Capacity:", home['Free_capacity'].toString()),
        _buildSummaryItem("Main Warehouse:", home['main_Warehouse']['name'] ?? ""),
        _buildSummaryItem("Branch:", home['branch']['name'] ?? ""),
      ],
    );
  }

  Widget _buildSummaryItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}