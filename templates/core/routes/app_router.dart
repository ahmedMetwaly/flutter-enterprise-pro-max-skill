import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../config/service_locator.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _createRoute(
          // Example with BlocProvider:
          // BlocProvider(
          //   create: (context) => getIt<SplashCubit>(),
          //   child: const SplashScreen(),
          // ),
          const Scaffold(body: Center(child: Text("Splash Screen"))),
        );

      case Routes.login:
        return _createRoute(
          // Example with BlocProvider:
          // BlocProvider(
          //   create: (context) => getIt<LoginCubit>(),
          //   child: const LoginScreen(),
          // ),
          const Scaffold(body: Center(child: Text("Login Screen"))),
        );

      case Routes.notAllowedUser:
        return _createRoute(
          const Scaffold(body: Center(child: Text("Not Allowed To Use App"))),
        );

      default:
        return _createRoute(
          const Scaffold(body: Center(child: Text("No Route"))),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page, {RouteSettings? settings}) {
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
