import 'package:flutter/material.dart';

import '../onboarding/view/onboarding_view.dart';
import '../splash/splash_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) =>
        Scaffold(
          appBar: AppBar(
            title: const Text('No route'), // todo implement in strings manager
          ),
          body: const Center(child: Text('no route found'),), // todo implement in strings manager
        ));
  }
}