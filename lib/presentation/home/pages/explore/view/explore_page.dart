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

  Map<String, List<dynamic>> exploreMap = {
    'titles' : [AppStrings.freshFruits, AppStrings.cookingOil, AppStrings.meat, AppStrings.snacks, AppStrings.dairy, AppStrings.beverages],
    'images' : [ImageAssets.fruits, ImageAssets.oils, ImageAssets.meat, ImageAssets.snacks, ImageAssets.dairy, ImageAssets.beverages],
    'colors' : [ColorManager.lightGreen, ColorManager.lightOrange, ColorManager.lightRed, ColorManager.lightPurple, ColorManager.lightYellow, ColorManager.lightPink],
    'borderColors' : [ColorManager.lightGreen2, ColorManager.lightOrange2, ColorManager.lightRed2, ColorManager.lightPurple2, ColorManager.lightYellow2, ColorManager.lightPink2],
  };

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
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: AppSize.s15,
              crossAxisSpacing: AppSize.s15,
              childAspectRatio: 1 / 1.1,
              children: List.generate(
                exploreMap['titles']!.length,
                    (index) => buildCard(title: exploreMap['titles']![index], image: exploreMap['images']![index], color: exploreMap['colors']![index], borderColor: exploreMap['borderColors']![index]),
              ),
            ),
            const SizedBox(height: AppSize.s15),
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
    return Container(
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
    );
  }
}
