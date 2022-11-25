import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.review, this.onPress});

  final String review;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          review,
          style: getSemiBoldStyle(
              fontSize: FontSize.s16, color: ColorManager.black),
        ),
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(ImageAssets.stars),
                IconButton(
                  onPressed: () {
                    if (onPress != null) onPress!();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
