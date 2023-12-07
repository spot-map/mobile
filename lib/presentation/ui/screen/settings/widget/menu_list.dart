import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/auth/auth_cubit.dart';
import 'package:ride_map/domain/bloc/theme/theme_cubit.dart';
import 'package:ride_map/presentation/ui/screen/settings/widget/menu.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool radioValue = false;
    return Scaffold(body: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            menuListItem(
              icon: Icons.brightness_4,
              title: 'Тема',
              action: FittedBox(
                child: Switch(
                  value: Prefs.getBool('theme') ?? context.read<ThemeCubit>().state.isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().onThemeChanged(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 13),
            menuListItem(
                icon: Icons.map,
                title: 'Отображение спотов',
                action: FittedBox(
                  child: Radio(
                    value: radioValue,
                    groupValue: 2,
                    onChanged: (Object? value) {},
                  ),
                )),
            GestureDetector(
              onTap: () {},
              child: menuListItem(icon: Icons.email, title: 'Сообщить об ошибке'),
            ),
            Prefs.getString('token') != null
                ?
            menuListItem(
              icon: Icons.exit_to_app,
              title: 'Выйти из аккаунта',
            )
                : Container()
          ],
        );
      },
    ));
  }
}
