import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscuredText;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscuredText = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Comfortaa',
          color: Colors.black
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        isDense: true,
        fillColor: Colors.white.withAlpha(180),
        filled: true,
      ),
      obscureText: obscuredText,
      style: const TextStyle(
        fontFamily: 'Comfortaa',
        color: Colors.black,
        fontSize: 15
      ),
      textAlign: TextAlign.center,
    );
  }
}
