import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.logout});

  final VoidCallback logout;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s353,
      height: AppSize.s67,
      child: ElevatedButton(
        onPressed: () {
          logout();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.darkLightGrey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.logout, color: ColorManager.primary),
            const SizedBox(width: AppSize.s100),
            Text(
              AppStrings.logOut,
              style: getSemiBoldStyle(
                  fontSize: FontSize.s18, color: ColorManager.primary),
            ),
          ],
        ),
      ),
    );
  }
}
