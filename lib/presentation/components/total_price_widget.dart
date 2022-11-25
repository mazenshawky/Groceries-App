import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s22,
      width: AppSize.s43,
      decoration: BoxDecoration(
        color: ColorManager.darkPrimary,
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
      child: Center(
        child: Text(
          AppStrings.tempTotal,
          style: getSemiBoldStyle(
              fontSize: FontSize.s12, color: ColorManager.white2),
        ),
      ),
    );
  }
}
