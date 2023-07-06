import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'package:ride_map/untils/theme/app_colors_dark.dart';
import 'package:ride_map/untils/theme/app_colors_light.dart';
import 'package:ride_map/untils/theme/base/i_app_color.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: Prefs.getBool('theme') ?? false)) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    Prefs.setBool('theme', event.isDark);
    emit(ThemeState(isDark: event.isDark));
  }
}
