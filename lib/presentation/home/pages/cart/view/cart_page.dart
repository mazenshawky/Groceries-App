import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/resources/assets_manager.dart';
import 'package:groceries_app/presentation/resources/font_manager.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartList = [
    {
      'image': ImageAssets.pepper2,
      'item': 'Bell Pepper Red',
      'amount': '1k, ',
      'price': 4.99,
    },
    {
      'image': ImageAssets.egg,
      'item': 'Egg Chicken Red',
      'amount': '4pcs, ',
      'price': 1.99,
    },
    {
      'image': ImageAssets.banana2,
      'item': 'Organic Bananas',
      'amount': '12kg, ',
      'price': 3.00,
    },
    {
      'image': ImageAssets.ginger2,
      'item': 'Ginger',
      'amount': '250gm, ',
      'price': 2.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: AppSize.s1,
          color: ColorManager.white4,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => buildCartItem(cartList[index], index),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                child: Divider(
                      thickness: AppSize.s1,
                      color: ColorManager.white4,
                    ),
              ),
              itemCount: cartList.length),
        ),
        SizedBox(
            width: AppSize.s353,
            height: AppSize.s67,
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: AppSize.s70),
                    const Text(
                      AppStrings.goToCheckout,
                    ),
                    const SizedBox(width: AppSize.s47_5),
                    Container(
                        height: AppSize.s22,
                        width: AppSize.s43,
                        decoration: BoxDecoration(
                          color: ColorManager.darkPrimary,
                          borderRadius: BorderRadius.circular(AppSize.s4),
                        ),
                        child: Center(
                            child: Text(AppStrings.tempTotal, style: getSemiBoldStyle(fontSize: FontSize.s12, color: ColorManager.white2),)
                        )
                    ),
                  ],
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
          padding: const EdgeInsets.only(top: AppPadding.p12, bottom: AppPadding.p15, right: AppPadding.p25, left: AppPadding.p25),
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
                          InkWell(onTap:(){}, child: Icon(Icons.close_outlined, color: ColorManager.grey3,))
                        ],
                      ),
                      Text(
                        '${map['amount']}${AppStrings.price}',
                        style: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
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
                                    borderRadius: BorderRadius.circular(AppSize.s17),
                                  ),
                                  child: InkWell(onTap: (){},child: Center(child: SvgPicture.asset(ImageAssets.minus))),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: AppSize.s17),
                                child: Center(
                                    child: Text(AppStrings.tempCount, style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.black),)
                                ),
                              ),
                              Container(
                                height: AppSize.s45_5,
                                width: AppSize.s45_5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorManager.white4),
                                  borderRadius: BorderRadius.circular(AppSize.s17),
                                ),
                                child: InkWell(onTap: (){},child: Center(child: SvgPicture.asset(ImageAssets.plus))),
                              ),
                            ],
                          ),
                          Text(
                            '${AppStrings.dollarSign}${map['price']}',
                            style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.black),

                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
        if(index == cartList.length - 1) Divider(
          thickness: AppSize.s1,
          color: ColorManager.white4,
        ),
      ],
    );
  }
}
