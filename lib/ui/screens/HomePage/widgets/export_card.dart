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
        width: 170,
        height: 110,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.substring(0,10),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}