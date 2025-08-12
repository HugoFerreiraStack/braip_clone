import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.prefixIcon,  this.obscureText, this.suffixIcon});
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.1),
        prefixIcon: Icon(prefixIcon, color: Colors.white),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.white) : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
