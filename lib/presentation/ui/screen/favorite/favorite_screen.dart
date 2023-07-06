import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/login/login_bloc.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/widget/favorite_layout.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/untils/dev.dart';
import 'package:ride_map/untils/preferences/preferences.dart';
import 'package:ride_map/untils/theme/dark/app_colors_dark.dart';
import 'package:ride_map/untils/theme/light/app_colors_light.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Prefs.getString('token') != null
          ? MyAppBar(
              title: 'Избранное',
              size: 50,
              centerTitle: false,
              automaticallyImplyLeading: false,
              widgetRight: [
                GestureDetector(
                  onTap: () {
                    Dev.log('TAP');
                    BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                  },
                  child: Icon(Icons.exit_to_app,
                      color: Prefs.getBool('theme')!
                          ? AppColorDark().backButtonColor
                          : AppColorLight().backButtonColor),
                )
              ],
            )
          : const MyAppBar(
              title: '', size: 50, automaticallyImplyLeading: false),
      body:
          Prefs.getString('token')!.isEmpty ? LoginScreen() : FavoriteLayout(),
    );
  }
}
