import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/theme/theme_cubit.dart';
import 'package:ride_map/presentation/common/router/router.dart';
import 'package:ride_map/until/bloc/bloc_inital.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocInitial.bloc,
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
