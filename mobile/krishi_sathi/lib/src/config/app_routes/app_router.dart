import 'package:flutter/material.dart';
import 'package:krishi_sathi/src/config/app_routes/app_route.dart';
import 'package:krishi_sathi/src/config/app_routes/no_route_found.dart';
import 'package:krishi_sathi/src/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.noRoute:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
