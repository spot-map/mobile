part of 'cubit.dart';

class ThemeState extends Equatable {
  AppColor get theme => isDark ? AppColorDark() : AppColorLight();
  final bool isDark;

  const ThemeState({required this.isDark});

  @override
  List<Object> get props => [isDark, theme];
}
