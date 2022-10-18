import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';
import 'package:groceries_app/presentation/resources/values_manager.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    // app bar theme
    // appBarTheme: AppBarTheme(
    //   centerTitle: true,
    //   color: ColorManager.primary,
    //   elevation: AppSize.s4,
    //   shadowColor: ColorManager.lightPrimary,
    //   titleTextStyle: getRegularStyle(fontSize: FontSize.s16,color: ColorManager.white),
    // ),

    // // button theme
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
      labelMedium: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.black),
      labelSmall: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.primary),
      titleMedium: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.lightWhite),
      titleSmall: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.grey),
      bodyMedium: getMediumStyle(fontSize: FontSize.s18, color: ColorManager.black),
      bodySmall: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.black),
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