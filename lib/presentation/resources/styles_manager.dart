import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}){
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  required Color color,
}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s18,
  required Color color,
}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s20,
  required Color color,
}){
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}