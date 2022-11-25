import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CartItem extends StatelessWidget {
  const CartItem({
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: AppPadding.p12,
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
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.close_outlined,
                              color: ColorManager.grey3,
                            ))
                      ],
                    ),
                    Text(
                      '${map['amount']}${AppStrings.price}',
                      style: getMediumStyle(
                          fontSize: FontSize.s14, color: ColorManager.grey),
                    ),
                    const SizedBox(height: AppSize.s13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: AppSize.s45_5,
                              width: AppSize.s45_5,
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorManager.white4),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s17),
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                      child:
                                          SvgPicture.asset(ImageAssets.minus))),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s17),
                              child: Center(
                                  child: Text(
                                AppStrings.tempCount,
                                style: getSemiBoldStyle(
                                    fontSize: FontSize.s18,
                                    color: ColorManager.black),
                              )),
                            ),
                            Container(
                              height: AppSize.s45_5,
                              width: AppSize.s45_5,
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorManager.white4),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s17),
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                      child:
                                          SvgPicture.asset(ImageAssets.plus))),
                            ),
                          ],
                        ),
                        Text(
                          '${AppStrings.dollarSign}${map['price']}',
                          style: getSemiBoldStyle(
                              fontSize: FontSize.s18,
                              color: ColorManager.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (index == length - 1)
          Divider(
            thickness: AppSize.s1,
            color: ColorManager.white4,
          ),
      ],
    );
  }
}
