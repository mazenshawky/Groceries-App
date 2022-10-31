import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p24, right: AppPadding.p25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.labelMedium,
              keyboardType: TextInputType.text,
              controller: _searchController,
              cursorColor: ColorManager.primary,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.darkLightGrey,
                hintStyle: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorManager.darkBlack,
                ),
                hintText: AppStrings.searchStore,
              ),
            ),
            const SizedBox(height: AppSize.s15),
            Row(
              children: [
                buildCard(title: AppStrings.freshFruits, image: ImageAssets.fruits, color: ColorManager.lightGreen, borderColor: ColorManager.lightGreen2),
                const SizedBox(width: AppSize.s15),
                buildCard(title: AppStrings.cookingOil, image: ImageAssets.oils, color: ColorManager.lightOrange, borderColor: ColorManager.lightOrange2),
              ],
            ),
            const SizedBox(height: AppSize.s15),
            Row(
              children: [
                buildCard(title: AppStrings.meat, image: ImageAssets.meat, color: ColorManager.lightRed, borderColor: ColorManager.lightRed2),
                const SizedBox(width: AppSize.s15),
                buildCard(title: AppStrings.snacks, image: ImageAssets.snacks, color: ColorManager.lightPurple, borderColor: ColorManager.lightPurple2),
              ],
            ),
            const SizedBox(height: AppSize.s15),
            Row(
              children: [
                buildCard(title: AppStrings.dairy, image: ImageAssets.dairy, color: ColorManager.lightYellow, borderColor: ColorManager.lightYellow2),
                const SizedBox(width: AppSize.s15),
                buildCard(title: AppStrings.beverages, image: ImageAssets.beverages, color: ColorManager.lightPink, borderColor: ColorManager.lightPink2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required String image,
    required String title,
    required Color color,
    required Color borderColor
  }){
    return Expanded(
      child: Container(
        height: AppSize.s189,
        width: AppSize.s173,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppSize.s18),
        ),
        child: InkWell(
          onTap: (){},
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
                      image: AssetImage(image),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
                child: Text(
                  title,
                  style: getBoldStyle(fontSize: FontSize.s16, color: ColorManager.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
