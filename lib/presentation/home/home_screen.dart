import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:groceries_app/presentation/home/pages/account/view/account_page.dart';
import 'package:groceries_app/presentation/home/pages/cart/view/cart_page.dart';
import 'package:groceries_app/presentation/home/pages/explore/view/explore_page.dart';
import 'package:groceries_app/presentation/home/pages/favourite/view/favourite_page.dart';
import 'package:groceries_app/presentation/home/pages/shop/view/shop_page.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = const [
    ShopPage(),
    ExplorePage(),
    CartPage(),
    FavouritePage(),
    AccountPage(),
  ];

  List<String> titles = [
    AppStrings.exploreTitle,
    AppStrings.cartTitle,
    AppStrings.favourite,
  ];

  String? _title;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: _currentIndex == 1 || _currentIndex == 2 || _currentIndex == 3,
      builder: (context) => Scaffold(
        backgroundColor: ColorManager.white,
        appBar: PreferredSize(
          preferredSize: _currentIndex != 1 ? const Size(double.infinity, AppSize.s80) : const Size(double.infinity, AppSize.s67),
          child: ConditionalBuilder(
            condition: _currentIndex != 1,
            builder: (context) => AppBar(
              title: Text(
                _title!,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, AppSize.s50),
                child: Divider(
                  thickness: AppSize.s1,
                  color: ColorManager.white4,
                ),
              ),
            ),
            fallback: (context) => AppBar(
                title: Text(
                _title!,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          height: AppSize.s82,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s37), topLeft: Radius.circular(AppSize.s37)),
            boxShadow: [
              BoxShadow(color: ColorManager.shadow, spreadRadius: AppSize.s5, blurRadius: AppSize.s10, offset: const Offset(AppSize.s0, AppSize.s_12)),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppSize.s15), topRight: Radius.circular(AppSize.s15)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.shop, color: _currentIndex == 0 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.shop),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.explore, color: _currentIndex == 1 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.explore),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.cart, color: _currentIndex == 2 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.cart),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.favourite, color: _currentIndex == 3 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.favourite),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.account, color: _currentIndex == 4 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.account),
              ],
            ),
          ),
        ),
      ),
      fallback: (context) => Scaffold(
        backgroundColor: ColorManager.white,
        body: pages[_currentIndex],
        bottomNavigationBar: Container(
          height: AppSize.s82,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s15), topLeft: Radius.circular(AppSize.s15)),
            boxShadow: [
              BoxShadow(color: ColorManager.shadow, spreadRadius: AppSize.s5, blurRadius: AppSize.s10, offset: const Offset(AppSize.s0, AppSize.s_12)),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppSize.s15), topRight: Radius.circular(AppSize.s15)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTap,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.shop, color: _currentIndex == 0 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.shop),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.explore, color: _currentIndex == 1 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.explore),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.cart, color: _currentIndex == 2 ? ColorManager.primary : ColorManager.black),
                   ),
                    label: AppStrings.cart),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.favourite, color: _currentIndex == 3 ? ColorManager.primary : ColorManager.black),
                   ),
                    label: AppStrings.favourite),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s5),
                      child: SvgPicture.asset(ImageAssets.account, color: _currentIndex == 4 ? ColorManager.primary : ColorManager.black),
                    ),
                    label: AppStrings.account),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTap(int index){
    setState(() {
      _currentIndex = index;
      if(_currentIndex == 1) _title = titles[0];
      else if(_currentIndex == 2) _title = titles[1];
      else if(_currentIndex == 3) _title = titles[2];
    });
  }
}
