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

TextStyle getMediumStyle({
  double fontSize = FontSize.s14,
  required Color color,
}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}