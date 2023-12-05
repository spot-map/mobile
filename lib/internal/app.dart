import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/domain/bloc/theme_cubit/theme_cubit.dart';
import 'package:ride_map/presentation/ui/screen/splash/splash_screen.dart';
import 'package:ride_map/until/bloc/bloc_inital.dart';
import 'package:ride_map/until/config/app_router.dart';
import 'package:ride_map/until/preferences/preferences.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocInitial.bloc,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          print('PREF ${Prefs.getBool('theme')}');
          return MaterialApp(
            navigatorKey: AppRouter.key,
            onGenerateRoute: (settings) {
              final builder = AppRouter.routes[settings.name];
              if (builder != null) {
                return MaterialPageRoute(
                    settings: settings,
                    builder: (context) => builder(context, settings.arguments));
              }
              return null;
            },
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
