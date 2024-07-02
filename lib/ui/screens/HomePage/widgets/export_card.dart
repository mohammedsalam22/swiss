import 'package:flutter/material.dart';

class ExportCard extends StatelessWidget {
  final String title;
  final String value;

  const ExportCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey,
      color: Colors.white,
      elevation: 2,
      child: Container(
        width: 150,
        height: 100,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}