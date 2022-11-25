import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s115,
      width: AppSize.s367,
      child: Card(
        elevation: AppSize.s0,
        child: Image.asset(
          ImageAssets.shopBanner,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
