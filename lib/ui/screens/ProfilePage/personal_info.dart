import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isEditing;

  const PersonalInfo({
    super.key,
    required this.title,
    required this.controller,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            flex: 3,
            child: isEditing
                ? TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  )
                : Text(
                    controller.text,
                    style: const TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }
}
