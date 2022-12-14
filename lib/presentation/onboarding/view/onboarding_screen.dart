import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/app/app_prefs.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/strings_manager.dart';
import 'package:groceries_app/presentation/resources/values_manager.dart';

import '../../../app/di.dart';
import '../../resources/routes_manager.dart';

class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    _appPreferences.setOnBoardingScreenViewed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.onBoarding),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: AppPadding.p400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.logoWhite),
              const SizedBox(height: AppSize.s18),
              Text(
                AppStrings.onBoardingTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: AppSize.s10),
              Text(
                AppStrings.onBoardingSubTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSize.s40),
              SizedBox(
                  width: AppSize.s353,
                  height: AppSize.s67,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                      },
                      child: const Text(
                        AppStrings.getStarted,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
