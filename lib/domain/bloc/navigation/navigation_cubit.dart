import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'constants/constants.dart';

part 'navigation_state.dart';

@injectable
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.home:
        emit(NavigationState(NavBarItem.home, 0));
        break;
      case NavBarItem.favorite:
        emit(NavigationState(NavBarItem.favorite, 1));
        break;
      case NavBarItem.account:
        emit(NavigationState(NavBarItem.account, 2));
        break;
      case NavBarItem.settings:
        emit(NavigationState(NavBarItem.settings, 3));
        break;
    }
  }
}
