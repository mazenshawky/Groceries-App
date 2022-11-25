import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s413_5,
      height: AppSize.s270,
      decoration: BoxDecoration(
        color: ColorManager.darkLightGrey,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s25),
            bottomRight: Radius.circular(AppSize.s25)),
      ),
      child: Center(
        child: SizedBox(
          width: AppSize.s329_5,
          height: AppSize.s199,
          child: Card(
            color: ColorManager.darkLightGrey,
            elevation: AppSize.s0,
            child: Image.asset(
              ImageAssets.vector,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
