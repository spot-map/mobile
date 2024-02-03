import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor {
  final Color textColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backButtonColor;
  final Color containerColor;
  final Color favoriteButtonColor;
  final Color deleteColor;
  final Color textFieldColor;
  final ThemeData themeData;

  AppColor(this.textColor, this.selectedItemColor, this.unselectedItemColor, this.backButtonColor, this.containerColor,
      this.favoriteButtonColor, this.deleteColor, this.textFieldColor, this.themeData);
}

extension AppColorExt on BuildContext {
  AppColor get colors => Provider.of<AppColor>(this, listen: false);
}
