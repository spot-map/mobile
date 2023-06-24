import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'constants/constants.dart';

part 'navigation_state.dart';

@injectable
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
      case NavBarItem.account:
        emit(const NavigationState(NavBarItem.account, 2));
        break;
      case NavBarItem.settings:
        emit(const NavigationState(NavBarItem.settings, 3));
        break;
    }
  }
}
