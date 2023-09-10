import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/login/constants/login_status.dart';
import 'package:ride_map/domain/bloc/login/login_bloc.dart';
import 'package:ride_map/presentation/ui/screen/authorization/registration_screen/registration_screen.dart';
import 'package:ride_map/presentation/ui/screen/favorite/favorite_screen.dart';
import 'package:ride_map/presentation/ui/widget/app_bar/app_bar.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';
import 'login_widget.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const Tab(text: 'Войти'),
      const Tab(text: 'Регистрация'),
    ];

    List<Widget> views = [const LoginWidget(), const RegistrationScreen()];

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.status == LoginStatus.error) {
          snackBar('Ошибка авторизации', context, true);
        } else if (state.status == LoginStatus.auth ||
            state.status == LoginStatus.registered) {
          return const Scaffold(body: FavoriteScreen());
        }

        return DefaultTabController(
            length: 2,
            child: Scaffold(
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
              body: TabBarView(children: views),
            ));
      },
    );
  }
}
