import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';
import 'package:groceries_app/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay(){
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
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
