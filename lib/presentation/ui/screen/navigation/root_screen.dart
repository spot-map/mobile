import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/navigation/constants/constants.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/screen/map/map_screen.dart';
import 'package:ride_map/presentation/ui/screen/settings/settings_screen.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'package:ride_map/untils/theme/dark/app_colors_dark.dart';
import 'package:ride_map/untils/theme/light/app_colors_light.dart';

import '../account/account_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  static const id = '/root';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            unselectedItemColor: AppColorLight().unselectedItemColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: Prefs.getBool('theme')!
                        ? AppColorDark().selectedItemColor
                        : AppColorLight().selectedItemColor,
                  ),
                  label: 'Главная'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  activeIcon: Icon(Icons.favorite,
                      color: AppColorLight().favoriteButtonColor),
                  label: 'Избранное'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  activeIcon: Icon(
                    Icons.person,
                    color: Prefs.getBool('theme')!
                        ? AppColorDark().selectedItemColor
                        : AppColorLight().selectedItemColor,
                  ),
                  label: 'Аккаунт'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  activeIcon: Icon(
                    Icons.settings,
                    color: Prefs.getBool('theme')!
                        ? AppColorDark().selectedItemColor
                        : AppColorLight().selectedItemColor,
                  ),
                  label: 'Настройки')
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.home);
                  break;
                case 1:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.favorite);
                  break;
                case 2:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.account);
                  break;
                case 3:
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavBarItem.settings);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.item == NavBarItem.home) {
            return const MapScreen();
          } else if (state.item == NavBarItem.favorite) {
            return Prefs.getString('token') == null
                ? const LoginScreen()
                : const FavoriteScreen();
          } else if (state.item == NavBarItem.account) {
            return const AccountScreen();
          } else if (state.item == NavBarItem.settings) {
            return const SettingsScreen();
          }
          return Container();
        },
      ),
    );
  }
}
