import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/home/pages/account/view/account_page.dart';
import 'package:groceries_app/presentation/home/pages/cart/view/cart_page.dart';
import 'package:groceries_app/presentation/home/pages/explore/view/explore_page.dart';
import 'package:groceries_app/presentation/home/pages/favourite/view/favourite_page.dart';
import 'package:groceries_app/presentation/home/pages/shop/view/shop_page.dart';
import 'package:groceries_app/presentation/resources/color_manager.dart';

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
        backgroundColor: ColorManager.white3,
        appBar: AppBar(
          title: Text(
            _title!,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: AppSize.s0,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.black,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: AppStrings.shop),
            BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: AppStrings.explore),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: AppStrings.cart),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: AppStrings.favourite),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: AppStrings.account),
          ],
        ),
      ),
      fallback: (context) => Scaffold(
        backgroundColor: ColorManager.white3,
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: AppSize.s0,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.black,
          currentIndex: _currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: AppStrings.shop),
            BottomNavigationBarItem(icon: Icon(Icons.manage_search), label: AppStrings.explore),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: AppStrings.cart),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: AppStrings.favourite),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: AppStrings.account),
          ],
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
