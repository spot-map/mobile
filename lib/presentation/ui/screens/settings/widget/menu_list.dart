import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/storage/theme.dart';
import 'package:ride_map/domain/storage/token.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/common/cubit/theme/cubit.dart';
import 'package:ride_map/presentation/ui/screens/settings/widget/menu.dart';

class MenuList extends StatelessWidget {
  MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            menuListItem(
              icon: Icons.brightness_4,
              title: 'Тема',
              action: FittedBox(
                child: Switch(
                  value: getIt<ThemeStorage>().theme ?? context.read<ThemeCubit>().state.isDark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().onThemeChanged(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 13),
            GestureDetector(
              onTap: () {},
              child: menuListItem(icon: Icons.email, title: 'Сообщить об ошибке'),
            ),
            getIt<TokenStorage>().accessToken != null
                ? menuListItem(
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
