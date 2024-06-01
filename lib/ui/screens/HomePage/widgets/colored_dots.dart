import 'package:flutter/material.dart';

class ColoredDotsList extends StatefulWidget {
  const ColoredDotsList({super.key});

  @override
  State<ColoredDotsList> createState() => _ColoredDotsListState();
}

class _ColoredDotsListState extends State<ColoredDotsList> {
  final List<ColorInfo> colorList = [
    ColorInfo(color: Colors.purple, name: 'Exports'),
    ColorInfo(color: Colors.deepPurple, name: 'Imports'),
    ColorInfo(color: Colors.blue, name: 'Material'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: colorList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final colorInfo = colorList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ColoredDot(color: colorInfo.color),
                  const SizedBox(width: 8),
                  Text(
                    colorInfo.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ColoredDot extends StatelessWidget {
  final Color color;

  const ColoredDot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class ColorInfo {
  final Color color;
  final String name;

  ColorInfo({required this.color, required this.name});
}