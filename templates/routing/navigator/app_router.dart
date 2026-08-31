import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _createRoute(const Scaffold(body: Center(child: Text('Splash Screen'))), settings);
      case Routes.login:
        return _createRoute(const Scaffold(body: Center(child: Text('Login Screen'))), settings);
      case Routes.notAllowedUser:
        return _createRoute(const Scaffold(body: Center(child: Text('Not Allowed To Use App'))), settings);
      default:
        return _createRoute(const Scaffold(body: Center(child: Text('No Route Defined'))), settings);
    }
  }

  PageRouteBuilder _createRoute(Widget page, RouteSettings? settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
