import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ride_map/domain/storage/theme.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/common/cubit/location/cubit.dart';
import 'package:ride_map/presentation/common/cubit/navigation/cubit.dart';
import 'package:ride_map/presentation/common/cubit/network/cubit.dart';
import 'package:ride_map/presentation/common/cubit/theme/cubit.dart';
import 'package:ride_map/presentation/common/router/router.dart';
import 'package:ride_map/until/theme/base/app_color.dart';
import 'package:ride_map/until/theme/dark/app_colors_dark.dart';
import 'package:ride_map/until/theme/light/app_colors_light.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AppColor>(create: (context) => getIt<ThemeStorage>().theme! ? AppColorDark() : AppColorLight()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(create: (_) => getIt()),
            BlocProvider<LocationCubit>(create: (_) => getIt()),
            BlocProvider<ThemeCubit>(create: (_) => getIt()),
            BlocProvider<NetworkCubit>(create: (_) => getIt())
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: appRouter,
                debugShowCheckedModeBanner: false,
                theme: state.theme.themeData,
              );
            },
          ),
        ));
  }
}
