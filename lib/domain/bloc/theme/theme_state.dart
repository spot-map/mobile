part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  IAppColor get theme => isDark ? AppColorDark() : AppColorLight();
  final bool isDark;

  const ThemeState({required this.isDark});

  @override
  List<Object> get props => [isDark, theme];
}
