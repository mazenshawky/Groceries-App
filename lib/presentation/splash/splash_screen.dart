import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/app/app_prefs.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';
import 'package:groceries_app/presentation/resources/routes_manager.dart';

import '../../app/di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay(){
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext(){
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
      if(isUserLoggedIn){
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        _appPreferences.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) {
          if(isOnBoardingScreenViewed){
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });

      }
    });

  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: SvgPicture.asset(ImageAssets.splashLogo)),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
