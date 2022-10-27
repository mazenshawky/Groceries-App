import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';
import 'package:groceries_app/presentation/resources/values_manager.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    splashColor: ColorManager.lightPrimary,

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.white,
      showUnselectedLabels: true,
      elevation: AppSize.s0,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.black,
      selectedLabelStyle: getSemiBoldStyle(fontSize: FontSize.s12, color: ColorManager.primary),
      unselectedLabelStyle: getSemiBoldStyle(fontSize: FontSize.s12, color: ColorManager.black),

    ),

    // button theme
    // buttonTheme: ButtonThemeData(
    //   shape: StadiumBorder(),
    //   disabledColor: ColorManager.grey1,
    //   buttonColor: ColorManager.primary,
    //   splashColor: ColorManager.lightPrimary,
    // ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.white2),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s19),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(fontSize: FontSize.s48, color: ColorManager.white),
      headlineMedium: getSemiBoldStyle(fontSize: FontSize.s26, color: ColorManager.black),
      headlineSmall: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.grey),
      labelLarge: getSemiBoldStyle(fontSize: FontSize.s24, color: ColorManager.black),
      labelMedium: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.black),
      labelSmall: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.primary),
      titleMedium: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.lightWhite),
      titleLarge: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.primary),
      titleSmall: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.grey),
      bodyLarge: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.darkGrey),
      bodyMedium: getMediumStyle(fontSize: FontSize.s18, color: ColorManager.black),
      bodySmall: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.black),
      displayLarge: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black),
      displayMedium: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.primary),
      displaySmall: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
    ),

    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getMediumStyle(fontSize: FontSize.s18, color: ColorManager.lightGrey),
      labelStyle: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.grey),
      errorStyle: getRegularStyle(color: ColorManager.error),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.lightLightGrey, width: AppSize.s1),
      ),

      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
      ),

      // error border style
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1),
      ),

      // focused error border style
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1),
      ),
    ),
  );
}