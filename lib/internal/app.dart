import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_map/presentation/ui/screen/authorization/login_screen/login_screen.dart';
import 'package:ride_map/untils/bloc/bloc_inital.dart';
import 'package:ride_map/untils/config/app_router.dart';
import '../presentation/ui/screen/navigation/root_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocInitial.bloc,
        child: MaterialApp(
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //theme: state.theme.themeData,
          home: const RootScreen(),
        ));
  }
}
