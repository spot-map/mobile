import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/domain/storage/theme.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/until/theme/base/app_color.dart';
import 'package:ride_map/until/theme/dark/app_colors_dark.dart';
import 'package:ride_map/until/theme/light/app_colors_light.dart';

part 'state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required bool isDark}) : super(ThemeState(isDark: getIt<ThemeStorage>().theme ?? false)) {
    onThemeChanged(isDark);
  }

  void onThemeChanged(bool isDark) async {
    getIt<ThemeStorage>().theme = isDark;
    emit(ThemeState(isDark: isDark));
  }
}
