import 'package:flutter/material.dart';

import '../splash/splash_view.dart';

class Routes{
  static const String splashRoute = "/";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
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