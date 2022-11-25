import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({super.key, required this.weight, this.onPress});

  final String weight;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.nutrition,
          style: getSemiBoldStyle(
            fontSize: FontSize.s16,
            color: ColorManager.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: AppSize.s18,
              width: AppSize.s33_5,
              decoration: BoxDecoration(
                color: ColorManager.grey2,
                borderRadius: BorderRadius.circular(AppSize.s5),
              ),
              child: Center(
                child: Text(
                  weight,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.s9, color: ColorManager.grey),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (onPress != null) onPress!();
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
