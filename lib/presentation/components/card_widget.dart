import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.map});

  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s248_5,
      width: AppSize.s173,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.white4),
        borderRadius: BorderRadius.circular(AppSize.s18),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.productDetailsRoute);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p25),
              child: Container(
                width: AppSize.s100,
                height: AppSize.s80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(map[AppStrings.image]),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s25),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p15, right: AppPadding.p14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            map['item'],
                            style: getBoldStyle(
                                fontSize: FontSize.s16,
                                color: ColorManager.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s5),
                  Text(
                    '${map['amount']}${AppStrings.price}',
                    style: getMediumStyle(
                        fontSize: FontSize.s14, color: ColorManager.grey),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: AppSize.s10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppStrings.dollarSign}${map['price']}',
                        style: getSemiBoldStyle(
                            fontSize: FontSize.s18, color: ColorManager.black),
                      ),
                      InkWell(
                        splashColor: Colors.teal,
                        onTap: () {},
                        child: SvgPicture.asset(ImageAssets.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
