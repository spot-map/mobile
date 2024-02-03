import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/presentation/common/cubit/navigation/constants/constants.dart';
import 'package:ride_map/presentation/common/cubit/navigation/cubit.dart';
import 'package:ride_map/presentation/common/cubit/spot/cubit.dart';
import 'package:ride_map/presentation/ui/screen/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/cubit.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/ui/screen/authorization/auth_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/screen/map/map_screen.dart';
import 'package:ride_map/presentation/ui/screen/settings/settings_screen.dart';

import 'package:ride_map/until/theme/base/app_color.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  static const path = 'root';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: BottomNavigationBar(
                currentIndex: state.index,
                unselectedItemColor: context.colors.unselectedItemColor,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home),
                      activeIcon: Icon(
                        Icons.home,
                        color: context.colors.selectedItemColor,
                      ),
                      label: 'Главная'),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite),
                      activeIcon: Icon(Icons.favorite, color: context.colors.favoriteButtonColor),
                      label: 'Избранное'),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      activeIcon: Icon(
                        Icons.settings,
                        color: context.colors.selectedItemColor,
                      ),
                      label: 'Настройки')
                ],
                onTap: (index) {
                  switch (index) {
                    case 0:
                      BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavBarItem.home);
                      break;
                    case 1:
                      BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavBarItem.favorite);
                      break;
                    case 2:
                      BlocProvider.of<NavigationCubit>(context).getNavBarItem(NavBarItem.settings);
                  }
                },
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.item == NavBarItem.home) {
            return BlocProvider<MapCubit>(create: (context) => getIt(), child: const MapScreen());
          } else if (state.item == NavBarItem.favorite) {
            return getIt<TokenStorage>().accessToken == null
                ? BlocProvider<AuthCubit>(create: (context) => getIt(), child: const AuthScreen())
                : BlocProvider<FavoriteCubit>(create: (_) => getIt(), child: const FavoriteScreen());
          } else if (state.item == NavBarItem.settings) {
            return const SettingsScreen();
          }
          return Container();
        },
      ),
    );
  }
}
