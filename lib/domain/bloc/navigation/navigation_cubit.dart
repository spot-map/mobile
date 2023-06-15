import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'constants/constants.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem){
    switch (navBarItem) {
      case NavBarItem.home:
        emit(NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.list:
        emit(NavigationState(NavBarItem.list, 1));
        break;
      case NavBarItem.favorite:
        emit(NavigationState(NavBarItem.favorite, 2));
        break;
      case NavBarItem.account:
        emit(NavigationState(NavBarItem.account, 3));
        break;
    }
  }
}
