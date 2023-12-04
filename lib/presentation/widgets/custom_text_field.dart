import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscuredText;
  final bool number;
  final Color borderColor;
  final Color hintTextColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color fontColor;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscuredText = false,
    this.number = false,
    this.borderColor = Colors.black,
    this.hintTextColor = Colors.black,
    this.focusedBorderColor = Colors.white,
    this.fillColor = Colors.white,
    this.fontColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    return TextField(
      controller: controller,
      keyboardType: number ? const TextInputType.numberWithOptions(
        signed: false,
        decimal: true
      ) : TextInputType.text,
      inputFormatters: [if(number) 
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Comfortaa',
          color: hintTextColor
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: 2,
          ),
        ),
        isDense: true,
        fillColor: fillColor.withAlpha(180),
        filled: true,
      ),
      obscureText: obscuredText,
      style: TextStyle(
        fontFamily: 'Comfortaa',
        color: fontColor,
        fontSize: 15
      ),
      textAlign: TextAlign.center,
    );
  }
}
