import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? errorText;
  final TextInputType? inputType;

  const InputTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.errorText,
    this.inputType,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          errorText: errorText,
        ),
        style: const TextStyle(height: 1.0),
        onChanged: onChanged,
      ),
    );
  }
}
