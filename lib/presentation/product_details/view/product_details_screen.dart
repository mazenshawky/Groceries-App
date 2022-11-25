import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/default_button.dart';
import 'package:groceries_app/presentation/components/nutrition_widget.dart';
import 'package:groceries_app/presentation/components/product_count.dart';
import 'package:groceries_app/presentation/components/product_image_widget.dart';
import 'package:groceries_app/presentation/components/product_name_widget.dart';
import 'package:groceries_app/presentation/components/review_widget.dart';
import 'package:groceries_app/presentation/components/share_icon_widget.dart';
import 'package:groceries_app/presentation/resources/font_manager.dart';
import 'package:groceries_app/presentation/resources/styles_manager.dart';

import '../../components/back_arrow_widget.dart';
import '../../components/divider_widget.dart';
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

  Widget _getContentWidget() {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          const ProductImageWidget(),
          const SizedBox(height: AppSize.s15),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p25,
              right: AppPadding.p25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductNameWidget(productName: AppStrings.temp),
                Text(
                  AppStrings.tempDescription,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSize.s30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProductCountWidget(count: AppStrings.tempCount),
                    Text(
                      AppStrings.tempPrice,
                      style: getBoldStyle(
                          fontSize: FontSize.s24, color: ColorManager.black),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s30),
                const DividerWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.productDetail,
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s16, color: ColorManager.black),
                    ),
                    IconButton(
                      onPressed: () {
                        isDetail = !isDetail;
                        setState(() {});
                      },
                      icon: Icon(isDetail
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
                if (isDetail)
                  Text(
                    AppStrings.tempDetail,
                    style: getMediumStyle(
                        fontSize: FontSize.s13, color: ColorManager.grey),
                  ),
                if (isDetail) const SizedBox(height: AppSize.s20),
                const DividerWidget(),
                const NutritionWidget(weight: AppStrings.tempWeight),
                const DividerWidget(),
                const ReviewWidget(review: AppStrings.review),
                const SizedBox(height: AppSize.s10),
                const DefaultButton(label: AppStrings.addToBasket),
                const SizedBox(height: AppSize.s35),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: ColorManager.darkLightGrey,
      leading: const Padding(
        padding: EdgeInsets.only(left: AppPadding.p25),
        child: BackArrowWidget(),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: AppPadding.p15),
          child: ShareIconWidget(),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appBar,
      body: _getContentWidget(),
    );
  }
}
