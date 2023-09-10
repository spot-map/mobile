import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ride_map/until/theme/base/i_app_color.dart';
import 'package:ride_map/until/theme/light/constants/string_colors.dart';
import 'package:ride_map/until/theme/to_hex.dart';

class AppColorLight implements IAppColor {
  static AppColorLight? _instance;

  factory AppColorLight() => _instance ??= AppColorLight._();

  AppColorLight._();

  @override
  final Color selectedItemColor =
      HexColor.fromHex(StringLightColors.selectedItemColor);

  @override
  Color get unselectedItemColor =>
      HexColor.fromHex(StringLightColors.unselectedItemColor);

  @override
  Color get textColor => HexColor.fromHex(StringLightColors.textColor);

  @override
  Color get backButtonColor => HexColor.fromHex(StringLightColors.backButtonColor);

  @override
  Color get containerColor => HexColor.fromHex(StringLightColors.containerColor);

  @override
  Color get favoriteButtonColor =>
      HexColor.fromHex(StringLightColors.favoriteButtonColor);

  @override
  Color get deleteColor => HexColor.fromHex(StringLightColors.deleteColor);

  @override
  Color get textFieldColor => HexColor.fromHex(StringLightColors.textFieldColor);

  @override
  final ThemeData themeData = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white
  );
}
