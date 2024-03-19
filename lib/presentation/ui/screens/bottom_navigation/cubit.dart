import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ride_map/data/constants/navigation_constants.dart';

part 'state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(const NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.favorite:
        emit(const NavigationState(NavBarItem.favorite, 1));
        break;
      case NavBarItem.settings:
        emit(const NavigationState(NavBarItem.settings, 2));
        break;
    }
  }
}
