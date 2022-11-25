import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class ProductNameWidget extends StatelessWidget {
  const ProductNameWidget({super.key, this.onPress, required this.productName});

  final String productName;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productName,
          style:
              getBoldStyle(fontSize: FontSize.s24, color: ColorManager.black),
        ),
        IconButton(
            onPressed: () {
              if (onPress != null) onPress!();
            },
            icon:
                Icon(Icons.favorite_outline_rounded, color: ColorManager.grey)),
      ],
    );
  }
}
