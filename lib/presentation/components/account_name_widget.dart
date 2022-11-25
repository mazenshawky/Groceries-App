import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class AccountNameWidget extends StatelessWidget {
  const AccountNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.name,
          style:
              getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black),
        ),
        const SizedBox(width: AppSize.s10),
        InkWell(
          onTap: () {},
          child: Icon(Icons.edit_outlined, color: ColorManager.primary),
        ),
      ],
    );
  }
}
