import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/data/favorite_page_models/favorite_model.dart';
import 'package:ride_map/data/map_page_models/map_model.dart';
import 'package:ride_map/domain/bloc/auth/auth_cubit.dart';
import 'package:ride_map/domain/bloc/favorite/favorite_cubit.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/spot/map_cubit.dart';
import 'package:ride_map/domain/bloc/theme/theme_cubit.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class BlocInitial {
  BlocInitial._();

  static final List<BlocProvider> bloc = [
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
    BlocProvider<FavoriteCubit>(create: (_) => FavoriteCubit(model: const FavoriteModel())),
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit(isDark: Prefs.getBool('theme')!)),
    BlocProvider<MapCubit>(create: (_) => MapCubit(model: const MapModel())),
    BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
  ];
}
