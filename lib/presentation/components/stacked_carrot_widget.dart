import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class StackedCarrotWidget extends StatelessWidget {
  const StackedCarrotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s300,
      child: Stack(
        children: [
          Container(
            height: AppSize.s300,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundUp),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(child: SvgPicture.asset(ImageAssets.logoOrange)),
        ],
      ),
    );
  }
}
