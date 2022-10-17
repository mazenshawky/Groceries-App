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
      titleMedium: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.lightWhite),
    ),

    // // input decoration theme(text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(AppPadding.p8),
    //   hintStyle: getRegularStyle(fontSize: FontSize.s14, color: ColorManager.grey),
    //   labelStyle: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
    //   errorStyle: getRegularStyle(color: ColorManager.error),
    //
    //   // enabled border style
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    //
    //   // focused border style
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    //
    //   // error border style
    //   errorBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    //
    //   // focused error border style
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //     borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    //   ),
    // ),
  );
}