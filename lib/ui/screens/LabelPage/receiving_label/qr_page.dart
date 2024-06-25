import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:swis_warehouse/ui/screens/LabelPage/receiving_label/reading_qr.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final TextEditingController _controller = TextEditingController();
  String _qrData = '';
  String _scanResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter data to generate QR code',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _controller.text;
                });
              },
              child: const Text('Generate QR Code'),
            ),
            const SizedBox(height: 20),
            if (_qrData.isNotEmpty)
              Center(
                child: QrImageView(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReceivingWarrantScreen()
                      //     QRViewExample(
                      //   onQRViewCreated: _onQRViewCreated,
                      // ),
                      ),
                );
              },
              child: const Text('Scan QR Code'),
            ),
            if (_scanResult.isNotEmpty)
              Text(
                'Scan Result: $_scanResult',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _scanResult = scanData.code!;
      });
      controller.dispose(); // Stop scanning after getting the result
      Navigator.pop(context); // Return to the main screen
    });
  }
}

class QRViewExample extends StatefulWidget {
  final void Function(QRViewController) onQRViewCreated;

  QRViewExample({required this.onQRViewCreated});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    widget.onQRViewCreated(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
