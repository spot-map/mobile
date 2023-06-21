part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  final int index;
  final NavBarItem item;

  NavigationState(this.item, this.index);

  @override
  List<Object> get props => [index, item];
}
