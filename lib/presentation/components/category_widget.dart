import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: AppSize.s248_5,
        height: AppSize.s105,
        decoration: BoxDecoration(
          color: map[AppStrings.color],
          borderRadius: BorderRadius.circular(AppSize.s18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppSize.s15_5, left: AppSize.s17, bottom: AppSize.s17_5),
              child: Container(
                width: AppSize.s70,
                height: AppSize.s70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(map[AppStrings.image]),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSize.s15),
            Text(
              map[AppStrings.title],
              style: getSemiBoldStyle(
                  fontSize: FontSize.s20, color: ColorManager.darkDarkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
