import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextStyles {
  final BuildContext? context;

  TextStyles({required this.context});

  TextStyle myTextStyleFontUbuntu({double? fontSize, Color? textColor, FontWeight? newFontWeight}) => TextStyle(
        color: textColor,
        fontFamily: 'Ubuntu',
        fontSize: fontSize ?? 16,
        fontWeight: newFontWeight ?? FontWeight.w400,
      );
}

extension TextStyleExt on BuildContext {
  TextStyles get textStyle => Provider.of<TextStyles>(this, listen: false);
}
