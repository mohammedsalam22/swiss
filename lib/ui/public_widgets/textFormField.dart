import 'package:flutter/material.dart';

class TextfromField extends StatelessWidget {
  const TextfromField(
      {super.key,
      required this.left,
      required this.right,
      required this.bottom,
      required this.labelText,
      required this.hintText,
      required this.suffixIcon,
      required this.keyboardType,
      required this.obscureText,
      required this.typeoffield,
      required this.validator});

  final double left;
  final double right;
  final double bottom;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String typeoffield;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: left, right: right, bottom: bottom),
      child: TextFormField(
        decoration: InputDecoration(
            border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 19,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
            suffixIcon: suffixIcon),
        validator: validator,
        style: const TextStyle(
          color: Colors.black,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
