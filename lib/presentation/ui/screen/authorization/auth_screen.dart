import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screen/authorization/cubit.dart';
import 'package:ride_map/presentation/ui/screen/favorite/cubit.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_widget.dart';
import 'package:ride_map/presentation/ui/screen/authorization/registration_screen/registration_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/page/common_scaffold.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const path = 'auth';

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const Tab(text: 'Войти'),
      const Tab(text: 'Регистрация'),
    ];

    List<Widget> views = [const LoginWidget(), const RegistrationScreen()];

    return DefaultTabController(
        length: 2,
        child: CommonScaffold(
          appBar: MyAppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: 'Авторизация',
            size: 100,
            bottomWidget: TabBar(
              labelColor: Colors.black,
              isScrollable: false,
              tabs: tabs,
            ),
          ),
          onMessage: (message) {
            if (message == AuthState.successLogin || message == AuthState.successRegistration) {
              return BlocProvider<FavoriteCubit>(create: getIt(), child: const Scaffold(body: FavoriteScreen()));
            } else if (message == AuthState.failureLogin || message == AuthState.failureRegistration) {
              snackBar(message: 'Ошибка авторизации', context: context, isError: true);
            }
          },
          message: context.read<AuthCubit>().messageStream,
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: false,
          child: TabBarView(children: views),
        ));
  }
}
