import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/navigation/constants/constants.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/screen/list/list_spot_screen.dart';
import 'package:ride_map/presentation/ui/screen/map/map_screen.dart';
import 'package:ride_map/untils/theme/appColors.dart';

import '../account/account_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            selectedItemColor: AppColor().selectedItemColor,
            unselectedItemColor: AppColor().unselectedItemColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  activeIcon:
                      Icon(Icons.home, color: AppColor().selectedItemColor),
                  label: 'Главная'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  activeIcon:
                      Icon(Icons.favorite, color: AppColor().favoriteButtonColor),
                  label: 'Избранное'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  activeIcon:
                      Icon(Icons.person, color: AppColor().selectedItemColor),
                  label: 'Аккаунт'),
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
            return const FavoriteScreen();
          }else if (state.item == NavBarItem.account) {
            return const AccountScreen();
          }
          return Container();
        },
      ),
    );
  }
}
