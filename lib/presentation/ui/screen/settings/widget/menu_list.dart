import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/theme/theme_bloc.dart';
import 'package:ride_map/presentation/ui/screen/settings/widget/menu.dart';
import 'package:ride_map/untils/preferences/preferences.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool radioValue = false;
    return Scaffold(
        body: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Column(
              children: [
                menuListItem(
                  icon: Icons.brightness_4,
                  title: 'Тема',
                  action: FittedBox(
                    child: Switch(
                      value: Prefs.getBool('theme') ?? BlocProvider
                          .of<ThemeBloc>(context)
                          .state
                          .isDark,
                      onChanged: (value) {
                        BlocProvider.of<ThemeBloc>(context).add(
                            ThemeChanged(value));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                menuListItem(
                    icon: Icons.map,
                    title: 'Отображение спотов',
                    action: FittedBox(
                      child: Radio(value: radioValue, groupValue: 2),
                    )),
              ],
            );
          },
        ));
  }
}
