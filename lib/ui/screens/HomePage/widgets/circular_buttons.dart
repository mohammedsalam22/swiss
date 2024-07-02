import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color bordercolor;

  final VoidCallback onPressed;

  const CircularButton(
      {super.key,
        required this.icon,
        required this.label,
        required this.onPressed,
        required this.color,
        required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            border: Border.all(color: bordercolor, width: 1),
            shape: BoxShape.circle,
            color: color,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: bordercolor,
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8.0), // Spacing between the button and the text
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}