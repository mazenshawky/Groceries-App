import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s25),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: SizedBox(
              height: AppSize.s45,
              child: Row(
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(width: AppSize.s20),
                  Text(
                    title,
                    style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.black),
                  ),
                  Expanded(child: Container()),
                  const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
                ],
              ),
            ),
          ),
          if(title != AppStrings.about) Divider(
            thickness: AppSize.s1,
            color: ColorManager.white4,
          ),
        ],
      ),
    );
  }
}