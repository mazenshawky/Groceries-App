import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/resources/font_manager.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isDetail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.darkLightGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: AppPadding.p25),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorManager.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p15),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ImageAssets.share, color: ColorManager.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: AppSize.s413_5,
              height: AppSize.s270,
              decoration: BoxDecoration(
                color: ColorManager.darkLightGrey,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.s25),
                    bottomRight: Radius.circular(AppSize.s25)),
              ),
              child: Center(
                child: SizedBox(
                  width: AppSize.s329_5,
                  height: AppSize.s199,
                  child: Card(
                    color: ColorManager.darkLightGrey,
                    elevation: AppSize.s0,
                    child: Image.asset(
                      ImageAssets.vector,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSize.s15),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p25, right: AppPadding.p25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.temp,
                        style: getBoldStyle(
                            fontSize: FontSize.s24, color: ColorManager.black),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_outline_rounded,
                              color: ColorManager.grey)),
                    ],
                  ),
                  Text(
                    AppStrings.tempDescription,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSize.s30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(onTap: (){}, child: SvgPicture.asset(ImageAssets.minus)),
                          Padding(
                            padding: const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
                            child: Container(
                                height: AppSize.s45_5,
                                width: AppSize.s45_5,
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorManager.white4),
                                  borderRadius: BorderRadius.circular(AppSize.s18),
                                ),
                                child: Center(
                                    child: Text(AppStrings.tempCount, style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.black),)
                                )
                            ),
                          ),
                          InkWell(onTap: (){}, child: SvgPicture.asset(ImageAssets.plus)),
                        ],
                      ),
                      Text(
                        AppStrings.tempPrice,
                        style: getBoldStyle(
                            fontSize: FontSize.s24, color: ColorManager.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s30),
                  Divider(
                    color: ColorManager.white5,
                    thickness: AppSize.s1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.productDetail, style: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.black)),
                      IconButton(onPressed: (){
                        isDetail = !isDetail;
                        setState(() {});
                      }, icon: Icon(isDetail ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)),
                    ],
                  ),
                  if(isDetail) Text(
                    AppStrings.tempDetail,
                    style: getMediumStyle(fontSize: FontSize.s13, color: ColorManager.grey),
                  ),
                  if(isDetail) const SizedBox(height: AppSize.s20),
                  Divider(
                    color: ColorManager.white5,
                    thickness: AppSize.s1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.nutrition, style: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: AppSize.s18,
                              width: AppSize.s33_5,
                              decoration: BoxDecoration(
                                color: ColorManager.grey2,
                                borderRadius: BorderRadius.circular(AppSize.s5),
                              ),
                              child: Center(
                                  child: Text(AppStrings.tempWeight, style: getSemiBoldStyle(fontSize: FontSize.s9, color: ColorManager.grey),)
                              )
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorManager.white5,
                    thickness: AppSize.s1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.review, style: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.black)),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(ImageAssets.stars),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
                  SizedBox(
                      width: AppSize.s353,
                      height: AppSize.s67,
                      child: ElevatedButton(
                          onPressed: () {
                          },
                          child: const Text(
                            AppStrings.addToBasket,
                          ))
                  ),
                  const SizedBox(height: AppSize.s35),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
