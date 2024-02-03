import 'package:flutter/material.dart';

TextStyle myTextStyleFontUbuntu(
        {double? fontSize, Color? textColor, FontWeight? newFontWeight, required BuildContext? context}) =>
    TextStyle(
      color: textColor,
      fontFamily: 'Ubuntu',
      fontSize: fontSize ?? 16,
      fontWeight: newFontWeight ?? FontWeight.w400,
    );
