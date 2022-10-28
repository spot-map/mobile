import 'package:flutter/material.dart';

typedef RouteBuilder = Widget Function(BuildContext context, dynamic arguments);

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static Future<T?> pushNamed<T extends Object?>(String routeName,
      {Object? arguments}) =>
      key.currentState!.pushNamed(routeName, arguments: arguments);

  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute,
      {TO? result}) =>
      key.currentState!.pushReplacement<T, TO>(newRoute, result: result);

  static void pop<T extends Object?>(BuildContext context, [T? result]) =>
      key.currentState!.pop<T>(result);

  static final Map<String, RouteBuilder> routes = {

  };

}
