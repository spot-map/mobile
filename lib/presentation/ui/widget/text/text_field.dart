import 'package:flutter/material.dart';
import 'package:ride_map/until/theme/base/app_color.dart';

class DefaultTextFiled extends StatelessWidget {
  const DefaultTextFiled(
      {super.key,
        required this.hinText,
        required this.controller,
        required this.keyboardType,
        required this.isObscureText,
        required this.onChanged,
        required this.errorText});

  final String hinText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isObscureText;
  final Function(String) onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: isObscureText,
        decoration: InputDecoration(
          filled: true,
          errorText: errorText,
          hintText: hinText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: errorText == null ? context.colors.textFieldColor : context.colors.deleteColor,
            ),
            borderRadius: BorderRadius.circular(8),
            gapPadding: 6,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: errorText == null ? context.colors.textFieldColor : context.colors.deleteColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
