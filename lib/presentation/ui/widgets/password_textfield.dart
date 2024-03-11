import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool enableVisibilityToggle;
  final void Function(String)? onChanged;

  const PasswordTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Password',
    this.enableVisibilityToggle = true,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          suffixIcon: widget.enableVisibilityToggle
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    !_obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey.shade500,
                  ))
              : null,
        ),
        obscureText: _obscureText,
        style: const TextStyle(height: 1.0),
        onChanged: widget.onChanged,
      ),
    );
  }
}
