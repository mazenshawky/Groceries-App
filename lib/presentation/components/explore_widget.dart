import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.borderColor,
  });

  final String image;
  final String title;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s189,
      width: AppSize.s173,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(AppSize.s18),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p25),
              child: Container(
                width: AppSize.s100,
                height: AppSize.s80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
              child: Text(
                title,
                style: getBoldStyle(
                    fontSize: FontSize.s16, color: ColorManager.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
