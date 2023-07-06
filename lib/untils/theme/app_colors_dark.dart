import 'dart:ui';
import 'package:flutter/src/material/theme_data.dart';
import 'package:ride_map/untils/theme/base/i_app_color.dart';
import 'package:ride_map/untils/theme/constants/string_colors.dart';
import 'package:ride_map/untils/theme/to_hex.dart';

class AppColorDark implements IAppColor {
  static AppColorDark? _instance;

  factory AppColorDark() => _instance ??= AppColorDark._();

  AppColorDark._();

  @override
  final Color selectedItemColor =
  HexColor.fromHex(StringColors.selectedItemColor);

  @override
  Color get unselectedItemColor =>
      HexColor.fromHex(StringColors.unselectedItemColor);

  @override
  Color get textColor => HexColor.fromHex(StringColors.textColor);

  @override
  Color get backButtonColor => HexColor.fromHex(StringColors.backButtonColor);

  @override
  Color get containerColor => HexColor.fromHex(StringColors.containerColor);

  @override
  Color get favoriteButtonColor =>
      HexColor.fromHex(StringColors.favoriteButtonColor);

  @override
  Color get deleteColor => HexColor.fromHex(StringColors.deleteColor);

  @override
  Color get textFieldColor => HexColor.fromHex(StringColors.textFieldColor);

  @override
  final ThemeData themeData = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: HexColor.fromHex(StringColors.textColor)
  );
}
