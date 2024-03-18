import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_map/domain/storage/theme.dart';
import 'package:ride_map/internal/di/inject.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/ui/screens/add_spot/cubit.dart';
import 'package:ride_map/presentation/ui/screens/add_spot/screen.dart';
import 'package:ride_map/presentation/ui/screens/bottom_navigation/screen.dart';
import 'package:ride_map/presentation/ui/screens/favorite/cubit.dart';
import 'package:ride_map/presentation/ui/screens/splash/screen.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/cubit.dart';
import 'package:ride_map/presentation/ui/screens/spot_by_id/screen.dart';
import 'package:ride_map/presentation/ui/widget/full_screen_image/full_screen_image.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(navigatorKey: _navigatorKey, initialLocation: AppRoutes.splash, routes: [
  GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
  GoRoute(path: AppRoutes.bottomNavigationHome, builder: (context, state) => RootScreen()),
  GoRoute(
      path: AppRoutes.addSpot,
      builder: (context, state) {
        final location = state.extra! as LatLng;
        return BlocProvider<AddSpotCubit>(create: (_) => getIt(), child: AddSpotScreen(currentUserLocation: location));
      }),
  GoRoute(
      path: AppRoutes.spotById,
      builder: (context, state) {
        final id = state.extra! as int;
        return MultiBlocProvider(providers: [
          BlocProvider<SpotByIdCubit>(create: (_) => getIt(param1: id)),
          BlocProvider<FavoriteCubit>(create: (_) => getIt())
        ], child: const SpotByIdScreen());

      }),
  GoRoute(
      path: AppRoutes.fullImageScreen,
      builder: (context, state) {
        final imagePath = state.extra! as String;
        return FullScreenPage(imagePath: imagePath, dark: getIt<ThemeStorage>().theme!);
      }),
]);
