import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_map/presentation/common/router/routes.dart';
import 'package:ride_map/presentation/ui/screen/navigation/root_screen.dart';
import 'package:ride_map/presentation/ui/screen/splash/splash_screen.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(navigatorKey: _navigatorKey, initialLocation: AppRoutes.splash, routes: [
  GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
  GoRoute(
    path: AppRoutes.bottomNavigationHome,
    builder: (context, state) => const RootScreen(),
  )
]);
