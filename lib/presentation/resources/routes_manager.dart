import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/login/view/login_screen.dart';

import '../onboarding/view/onboarding_screen.dart';
import '../splash/splash_screen.dart';
import 'strings_manager.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) =>
        Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound),),
        ));
  }
}