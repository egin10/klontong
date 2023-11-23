import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;

  const CustomTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 20,
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
