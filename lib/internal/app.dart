import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/location/location_cubit.dart';
import 'package:ride_map/domain/bloc/navigation/navigation_cubit.dart';
import 'package:ride_map/domain/bloc/theme/theme_cubit.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/common/router/router.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<NavigationCubit>(create: (_) => getIt()),
        BlocProvider<LocationCubit>(create: (_) => getIt()),
        BlocProvider<ThemeCubit>(create: (_) => getIt())
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
    );
  }
}
