import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hintText;
  final IconData? icon;
  final String? errorText;

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.icon,
    this.controller,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.borderColor = Colors.black,
    this.focusedBorderColor = Colors.white,
    this.errorBorderColor = Colors.red,
    this.focusedErrorBorderColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.disabled,

      decoration: InputDecoration(
        label: (label != null) ? Text(label!) : null,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: (icon != null) ? Icon(icon) : null,

        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: 2
          )
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(
            color: errorBorderColor,
          )
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(
            color: focusedErrorBorderColor,
            width: 2
          )
        ),
        isDense: true,
      ),
    );
  }
}