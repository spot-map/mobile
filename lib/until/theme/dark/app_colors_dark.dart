import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ride_map/until/theme/base/app_color.dart';
import 'package:ride_map/until/theme/dark/constants/string_colors.dart';
import 'package:ride_map/until/theme/hex.dart';

class AppColorDark implements AppColor {
  static AppColorDark? _instance;

  factory AppColorDark() => _instance ??= AppColorDark._();

  AppColorDark._();

  @override
  final Color selectedItemColor = HexColor.fromHex(StringDarkColors.selectedItemColor);

  @override
  Color get unselectedItemColor => HexColor.fromHex(StringDarkColors.unselectedItemColor);

  @override
  Color get textColor => HexColor.fromHex(StringDarkColors.textColor);

  @override
  Color get backButtonColor => HexColor.fromHex(StringDarkColors.backButtonColor);

  @override
  Color get containerColor => HexColor.fromHex(StringDarkColors.containerColor);

  @override
  Color get favoriteButtonColor => HexColor.fromHex(StringDarkColors.favoriteButtonColor);

  @override
  Color get deleteColor => HexColor.fromHex(StringDarkColors.deleteColor);

  @override
  Color get textFieldColor => HexColor.fromHex(StringDarkColors.textFieldColor);

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle.light;


  @override
  Color get hintColor =>  HexColor.fromHex(StringDarkColors.textColor);

  @override
  final ThemeData themeData =
      ThemeData(brightness: Brightness.dark, backgroundColor: HexColor.fromHex(StringDarkColors.textColor));
}
