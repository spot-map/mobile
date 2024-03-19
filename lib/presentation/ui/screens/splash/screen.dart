import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_map/presentation/common/assets/app_assets.dart';
import 'package:ride_map/presentation/common/cubit/network/cubit.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/ui/widget/page/common_scaffold.dart';
import 'package:ride_map/presentation/ui/widget/snack/snack_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const path = 'splash';

  void _goTo(BuildContext context) {
    Timer(const Duration(seconds: 3), () => context.go(AppRoutes.bottomNavigationHome));
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(),
      message: context.read<NetworkCubit>().messageStream,
      onMessage: (String message) {
        if (message == NetworkState.isConnected) {
          _goTo(context);
        } else if (message == NetworkState.isVPN) {
          snackBar(
              isWarning: true,
              message: 'Включенный VPN может замедлить работу приложения',
              context: context,
              isError: false);
          _goTo(context);
        } else if (message == NetworkState.noConnection) {
          snackBar(message: 'Нет подключения', context: context, isError: true);
        }
      },
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      child: Center(
        child: Image.asset(AppAssets.splashIcon),
      ),
    );
  }
}
