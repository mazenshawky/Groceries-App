import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<Map<String, dynamic>> favouriteList = [
    {
      'image': ImageAssets.sprite,
      'item': 'Sprite Can',
      'amount': '325ml, ',
      'price': 1.50,
    },
    {
      'image': ImageAssets.coke,
      'item': 'Diet Coke',
      'amount': '335ml, ',
      'price': 1.99,
    },
    {
      'image': ImageAssets.appleJuice2,
      'item': 'Apple & Grape Juice',
      'amount': '2L, ',
      'price': 15.50,
    },
    {
      'image': ImageAssets.cocaCola,
      'item': 'Coca Cola Can',
      'amount': '325ml, ',
      'price': 4.99,
    },
    {
      'image': ImageAssets.pepsi,
      'item': 'Pepsi Can ',
      'amount': '330ml, ',
      'price': 4.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildCartItem(favouriteList[index], index),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                child: Divider(
                  thickness: AppSize.s1,
                  color: ColorManager.white4,
                ),
              ),
              itemCount: favouriteList.length),
        ),
        SizedBox(
            width: AppSize.s353,
            height: AppSize.s67,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.addAllToCart,
                ),
            ),
        ),
        const SizedBox(height: AppSize.s25),
      ],
    );
  }

  Widget buildCartItem(Map<String, dynamic> map, index){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p18, bottom: AppPadding.p15, right: AppPadding.p25, left: AppPadding.p25),
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
                          style: getBoldStyle(fontSize: FontSize.s16, color: ColorManager.black),
                        ),
                      ],
                    ),
                    Text(
                      '${map['amount']}${AppStrings.price}',
                      style: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
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
                    style: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.black),
                  ),
                  const SizedBox(width: AppSize.s16),
                  InkWell(onTap: (){}, child: const Icon(Icons.arrow_forward_ios, size: AppSize.s18)),
                ],
              ),
            ],
          ),
        ),
        if(index == favouriteList.length - 1) Divider(
          thickness: AppSize.s1,
          color: ColorManager.white4,
        ),
      ],
    );
  }
}
