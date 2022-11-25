import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class ShareIconWidget extends StatelessWidget {
  const ShareIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(ImageAssets.share, color: ColorManager.black),
    );
  }
}
