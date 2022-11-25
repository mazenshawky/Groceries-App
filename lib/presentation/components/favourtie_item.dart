import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/divider_widget.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    super.key,
    required this.map,
    required this.index,
    required this.length,
  });

  final Map<String, dynamic> map;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p18,
                  bottom: AppPadding.p15,
                  right: AppPadding.p25,
                  left: AppPadding.p25),
              child: Row(
                children: [
                  Container(
                    width: AppSize.s55,
                    height: AppSize.s55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(map[AppStrings.image]),
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s22),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              map['item'],
                              style: getBoldStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black),
                            ),
                          ],
                        ),
                        Text(
                          '${map['amount']}${AppStrings.price}',
                          style: getMediumStyle(
                              fontSize: FontSize.s14, color: ColorManager.grey),
                        ),
                        const SizedBox(height: AppSize.s13),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppStrings.dollarSign}${map['price']}',
                        style: getSemiBoldStyle(
                            fontSize: FontSize.s16, color: ColorManager.black),
                      ),
                      const SizedBox(width: AppSize.s16),
                      const Icon(Icons.arrow_forward_ios, size: AppSize.s18),
                    ],
                  ),
                ],
              ),
            ),
            if (index == length - 1) const DividerWidget(),
          ],
        ),
      ),
    );
  }
}
