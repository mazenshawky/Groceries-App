import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget(
      {super.key, required this.count, this.plus, this.minus});

  final String count;
  final VoidCallback? plus;
  final VoidCallback? minus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (minus != null) minus!();
          },
          child: SvgPicture.asset(ImageAssets.minus),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p20, right: AppPadding.p20),
          child: Container(
            height: AppSize.s45_5,
            width: AppSize.s45_5,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.white4),
              borderRadius: BorderRadius.circular(AppSize.s18),
            ),
            child: Center(
              child: Text(
                count,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: ColorManager.black),
              ),
            ),
          ),
        ),
        InkWell(
            onTap: () {
              if (plus != null) plus!();
            },
            child: SvgPicture.asset(ImageAssets.plus)),
      ],
    );
  }
}
