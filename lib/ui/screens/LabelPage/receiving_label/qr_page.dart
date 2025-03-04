// lib/qr_scanner.dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRScanner extends StatefulWidget {
  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  String result = "Scan a QR code";
  Map<String, dynamic>? transactionData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (BarcodeCapture barcodeCapture) {
                final List<Barcode> barcodes = barcodeCapture.barcodes;
                if (barcodes.isNotEmpty) {
                  final String? scannedValue = barcodes.first.rawValue;
                  if (scannedValue != null) {
                    // Assuming the scanned value is the ID
                    fetchTransactionData(scannedValue);
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ),
          if (transactionData != null) ...[
            // Display transaction details if available
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Transaction ID: ${transactionData!['id']}"),
                  ),
                  ListTile(
                    title: Text("Status: ${transactionData!['status']}"),
                  ),
                  ListTile(
                    title: Text("Date: ${transactionData!['date']}"),
                  ),
                  ListTile(
                    title: Text("Transaction Type: ${transactionData!['transaction_type']}"),
                  ),
                  ListTile(
                    title: Text("Waybill Number: ${transactionData!['waybill_num']}"),
                  ),
                  // Add more fields as needed
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> fetchTransactionData(String id) async {
    final url = 'https://swis.mouhannadabdalrhem.online/api/showTransactionForKeeper/$id';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        setState(() {
          transactionData = jsonResponse['data']; // Store the transaction data
          result = "Transaction fetched successfully!";
        });
      } else {
        setState(() {
          result = "Failed to fetch transaction data.";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }
}