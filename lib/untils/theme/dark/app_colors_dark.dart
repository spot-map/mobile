import 'dart:ui';
import 'package:flutter/src/material/theme_data.dart';
import 'package:ride_map/untils/theme/base/i_app_color.dart';
import 'package:ride_map/untils/theme/dark/constants/string_colors.dart';
import 'package:ride_map/untils/theme/to_hex.dart';

class AppColorDark implements IAppColor {
  static AppColorDark? _instance;

  factory AppColorDark() => _instance ??= AppColorDark._();

  AppColorDark._();

  @override
  final Color selectedItemColor =
  HexColor.fromHex(StringDarkColors.selectedItemColor);

  @override
  Color get unselectedItemColor =>
      HexColor.fromHex(StringDarkColors.unselectedItemColor);

  @override
  Color get textColor => HexColor.fromHex(StringDarkColors.textColor);

  @override
  Color get backButtonColor => HexColor.fromHex(StringDarkColors.backButtonColor);

  @override
  Color get containerColor => HexColor.fromHex(StringDarkColors.containerColor);

  @override
  Color get favoriteButtonColor =>
      HexColor.fromHex(StringDarkColors.favoriteButtonColor);

  @override
  Color get deleteColor => HexColor.fromHex(StringDarkColors.deleteColor);

  @override
  Color get textFieldColor => HexColor.fromHex(StringDarkColors.textFieldColor);

  @override
  final ThemeData themeData = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: HexColor.fromHex(StringDarkColors.textColor)
  );
}
