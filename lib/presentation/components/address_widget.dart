import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImageAssets.location, color: ColorManager.darkGrey),
        const SizedBox(width: AppSize.s8),
        Text(
          AppStrings.location,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
