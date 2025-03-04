import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton(
      {super.key, required this.RouteName, required this.ButtonName,required this.function()});

  final String RouteName;
  final String ButtonName;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:function,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(255, 244, 0, 0)),
        minimumSize: WidgetStateProperty.all(const Size(250, 55)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.only(top: 2, left: 70, right: 70, bottom: 1),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10), // Set the border radius to 0 for rectangle
          ),
        ),
      ),
      child: Text(
        ButtonName,
        style: const TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }
}
