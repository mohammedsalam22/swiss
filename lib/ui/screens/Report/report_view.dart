import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart'; // Use share_plus instead of share
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

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/warehouse_report.pdf");
    await file.writeAsBytes(await pdf.save());

    Share.shareXFiles([XFile(file.path)],
        text: 'Warehouse Report PDF'); // Use shareXFiles
  }

  Future<void> _generateExcel(String base64String) async {
    try {
      // Clean and validate base64 string
      base64String = base64String.trim();

      // Decode base64 string to bytes
      List<int> bytes;
      try {
        bytes = base64.decode(base64String.replaceAll(RegExp(r'\s+'), ''));
      } catch (e) {
        throw FormatException('Error decoding base64 string: $e');
      }

      // Get the directory to save the file
      Directory directory = await getApplicationDocumentsDirectory();
      String path = '${directory.path}/decoded_file.xlsx';

      // Save the bytes to an Excel file
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
    } catch (e) {
      print('Error processing Excel file: $e');
    }
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<InventoryCubit>(context, listen: false)
          .getAllFile();
    });
    super.initState();
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
            return CircularProgressIndicator();
          }
          if (BlocProvider.of<InventoryCubit>(context).files == null) {
            return CircularProgressIndicator();
          }
          var hh = BlocProvider.of<InventoryCubit>(context).files;
          return ListView.builder(
            itemCount: hh.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(hh[index]['name']),
                subtitle: Text(hh[index]['path']),
                onTap: () async {
                  var hh5 = BlocProvider.of<InventoryCubit>(context) ;
                  await hh5.download(hh[index]['path']);
                  if (state.status == InventoryStatus.success) {
                    print('sssss') ;
                  }
                },
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
            onPressed: () {},
            label: Text('Generate Excel'),
            icon: Icon(Icons.table_chart),
          ),
        ],
      ),
    );
  }
}
