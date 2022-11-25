import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class AccountImageWidget extends StatelessWidget {
  const AccountImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s64,
      height: AppSize.s64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s27),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageAssets.accountImage),
          )),
    );
  }
}
