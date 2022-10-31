import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> exclusiveList = [
    {
      'image' : ImageAssets.banana,
      'item' : 'Organic Bananas',
      'amount' : '7pcs, ',
      'price' : 5.21,
    },
    {
      'image' : ImageAssets.mayonnaise,
      'item' : 'Mayonnais Eggless',
      'amount' : '325ml, ',
      'price' : 4.99,
    },
    {
      'image' : ImageAssets.appleJuice,
      'item' : 'Apple & Grape Juice',
      'amount' : '2L, ',
      'price' : 15.99,
    },
  ];

  List<Map<String, dynamic>> bestSellingList = [
    {
      'image' : ImageAssets.pepper,
      'item' : 'Bell Pepper Red',
      'amount' : '1Kg, ',
      'price' : 4.99,
    },
    {
      'image' : ImageAssets.ginger,
      'item' : 'Ginger',
      'amount' : '250gm, ',
      'price' : 4.99,
    },
    {
      'image' : ImageAssets.banana,
      'item' : 'Organic Bananas',
      'amount' : '7pcs, ',
      'price' : 5.21,
    },
  ];

  List<Map<String, dynamic>> groceriesList = [
    {
      'image' : ImageAssets.beef,
      'item' : 'Beef Bone',
      'amount' : '1Kg, ',
      'price' : 4.99,
    },
    {
      'image' : ImageAssets.chicken,
      'item' : 'Broiler Chicken',
      'amount' : '1Kg, ',
      'price' : 4.99,
    },
    {
      'image' : ImageAssets.banana,
      'item' : 'Organic Bananas',
      'amount' : '7pcs, ',
      'price' : 5.21,
    },
  ];

  List<Map<String, dynamic>> categories = [
    {
      AppStrings.image : ImageAssets.pulses,
      AppStrings.color : ColorManager.lightOrange,
      AppStrings.title : AppStrings.pulses,
    },
    {
      AppStrings.image : ImageAssets.rice,
      AppStrings.color : ColorManager.lightGreen,
      AppStrings.title : AppStrings.rice,
    },
    {
      AppStrings.image : ImageAssets.beverages,
      AppStrings.color : ColorManager.lightPurple,
      AppStrings.title : AppStrings.beverages,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p58),
      child: SingleChildScrollView(
        child: _getContentWidget(),
      ),
    );
  }

  Widget _getContentWidget() {
    return Column(
      children: [
        Center(child: SvgPicture.asset(ImageAssets.logoOrangeSmall)),
        const SizedBox(height: AppSize.s5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.location, color: ColorManager.darkGrey),
            const SizedBox(width: AppSize.s8),
            Text(
              AppStrings.location,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        const SizedBox(height: AppSize.s20),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p24, right: AppPadding.p25),
          child: TextFormField(
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
        ),
        const SizedBox(height: AppSize.s15),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p23_5, right: AppPadding.p23_5),
          child: SizedBox(
            height: AppSize.s115,
            width: AppSize.s367,
            child:  Card(
              elevation: AppSize.s0,
              child: Image.asset(ImageAssets.shopBanner,fit: BoxFit.cover,),
            ),
          ),
        ),
        const SizedBox(height: AppSize.s40),
        buildTitle(AppStrings.exclusiveOffer),
        const SizedBox(height: AppSize.s26),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p19),
          child: SizedBox(
            height: AppSize.s248_5,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildCard(exclusiveList[index]),
                separatorBuilder: (context, index) => const SizedBox(width: AppSize.s15),
                itemCount: 3,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s50),
        buildTitle(AppStrings.bestSelling),
        const SizedBox(height: AppSize.s26),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p19),
          child: SizedBox(
            height: AppSize.s248_5,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCard(bestSellingList[index]),
              separatorBuilder: (context, index) => const SizedBox(width: AppSize.s15),
              itemCount: 3,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s50),
        buildTitle(AppStrings.groceries),
        const SizedBox(
          height: AppSize.s26,
        ),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p19),
          child: SizedBox(
            height: AppSize.s105,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCategory(categories[index]),
              separatorBuilder: (context, index) => const SizedBox(width: AppSize.s10),
              itemCount: 3,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s12,),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p19),
          child: SizedBox(
            height: AppSize.s248_5,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildCard(groceriesList[index]),
              separatorBuilder: (context, index) => const SizedBox(width: AppSize.s15),
              itemCount: 3,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s20),
      ],
    );
  }
  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          InkWell(
            onTap: (){},
            child: Text(
              AppStrings.seeAll,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCard(Map<String, dynamic> map){
    return Container(
      height: AppSize.s248_5,
      width: AppSize.s173,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.white4),
        borderRadius: BorderRadius.circular(AppSize.s18),
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(Routes.productDetailsRoute);
        },
        child: Card(
          color: ColorManager.white,
          shadowColor: ColorManager.white,
          elevation: AppSize.s0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s18),
          ),
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
                padding: const EdgeInsets.only(left: AppPadding.p15, right: AppPadding.p14),
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
                              style: getBoldStyle(fontSize: FontSize.s16, color: ColorManager.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s5),
                    Text(
                      '${map['amount']}${AppStrings.price}',
                      style: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: AppSize.s10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppStrings.dollarSign}${map['price']}',
                          style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.black),
                        ),
                        InkWell(
                          splashColor: Colors.teal,
                          onTap: (){

                          },
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
      ),
    );
  }

  Widget buildCategory(Map<String, dynamic> map) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: AppSize.s248_5,
        height: AppSize.s105,
        decoration: BoxDecoration(
          color: map[AppStrings.color],
          borderRadius: BorderRadius.circular(AppSize.s18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSize.s15_5, left: AppSize.s17, bottom: AppSize.s17_5),
              child: Container(
                width: AppSize.s70,
                height: AppSize.s70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(map[AppStrings.image]),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSize.s15),
            Text(
              map[AppStrings.title],
              style: getSemiBoldStyle(fontSize: FontSize.s20,color: ColorManager.darkDarkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
