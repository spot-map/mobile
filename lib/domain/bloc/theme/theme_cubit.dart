import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/until/preferences/preferences.dart';
import 'package:ride_map/until/theme/base/i_app_color.dart';
import 'package:ride_map/until/theme/dark/app_colors_dark.dart';
import 'package:ride_map/until/theme/light/app_colors_light.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required bool isDark}) : super(ThemeState(isDark: Prefs.getBool('theme') ?? false)) {
    onThemeChanged(isDark);
  }

  void onThemeChanged(bool isDark) async {
    Prefs.setBool('theme', isDark);
    emit(ThemeState(isDark: isDark));
  }
}
