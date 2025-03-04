import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart'; // Import the open_file package
import 'dart:io';
import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';

class WarehouseReportPage extends StatefulWidget {
  @override
  _WarehouseReportPageState createState() => _WarehouseReportPageState();
}

class _WarehouseReportPageState extends State<WarehouseReportPage> {
  final List<Map<String, dynamic>> _warehouseData = [
    {'name': 'Item A', 'quantity': 100, 'location': 'Aisle 1'},
    {'name': 'Item B', 'quantity': 200, 'location': 'Aisle 2'},
    // Add more items here...
  ];

  void _generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Warehouse Report', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['Item Name', 'Quantity', 'Location'],
                data: _warehouseData.map((item) {
                  return [item['name'], item['quantity'], item['location']];
                }).toList(),
              ),
            ],
          );
        },
      ),
    );

    // Get the directory to save the PDF file
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/warehouse_report.pdf";
    final file = File(filePath);

    // Write the PDF file to the device
    await file.writeAsBytes(await pdf.save());

    // Notify the user that the file has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to $filePath')),
    );

    // Open the PDF file
    final result = await OpenFile.open(filePath);
    if (result.message != 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open the file: ${result.message}')),
      );
    }
  }

  Future<void> _generateExcel(String base64String) async {
    try {
      base64String = base64String.trim();
      List<int> bytes = base64.decode(base64String.replaceAll(RegExp(r'\s+'), ''));

      Directory directory = await getApplicationDocumentsDirectory();
      String path = '${directory.path}/decoded_file.xlsx';

      File file = File(path);
      await file.writeAsBytes(bytes);

      print('Excel file saved at: $path');

      // Load and parse the Excel file
      var bytesFromFile = file.readAsBytesSync();
      var excel = Excel.decodeBytes(bytesFromFile);

      // Print sheet names and rows
      for (var table in excel.tables.keys) {
        print('Sheet name: $table');
        for (var row in excel.tables[table]!.rows) {
          print(row);
        }
      }

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Excel file generated successfully!')),
      );
    } catch (e) {
      print('Error processing Excel file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error generating Excel file.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<InventoryCubit>(context, listen: false).getAllFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Report'),
      ),
      body: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          if (state.status == InventoryStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (BlocProvider.of<InventoryCubit>(context).files == null) {
            return Center(child: Text('No files available.'));
          }
          var files = BlocProvider.of<InventoryCubit>(context).files;
          return ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(files[index]['name']),
                  subtitle: Text(files[index]['path']),
                  onTap: () async {
                    await BlocProvider.of<InventoryCubit>(context).download(files[index]['path']);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Downloading ${files[index]['name']}...')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: _generatePDF,
            label: Text('Generate PDF'),
            icon: Icon(Icons.picture_as_pdf),
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () {
              // Implement Excel generation logic here
              // _generateExcel(base64String); // Pass a valid base64 string
            },
            label: Text('Generate Excel'),
            icon: Icon(Icons.table_chart),
          ),
        ],
      ),
    );
  }
}