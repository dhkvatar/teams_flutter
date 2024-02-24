import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const InputTextField({
    super.key,
    this.controller,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          // fillColor: Colors.grey.shade200,
          // filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
