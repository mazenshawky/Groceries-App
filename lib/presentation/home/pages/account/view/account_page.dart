import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/home/pages/account/view/account_item.dart';

import '../../../../../app/app_prefs.dart';
import '../../../../../app/di.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../resources/values_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p25, bottom: AppPadding.p20, top: AppPadding.p70),
            child: Row(
              children: [
                Container(
                  width: AppSize.s64,
                  height: AppSize.s64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s27),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageAssets.accountImage),
                      )
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                AppStrings.name,
                                style: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black),
                              ),
                              const SizedBox(width: AppSize.s10),
                              InkWell(onTap: (){}, child: Icon(Icons.edit_outlined, color: ColorManager.primary))
                            ],
                          ),
                          const SizedBox(height: AppSize.s3),
                          Text(
                            AppStrings.emailAddress,
                            style: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: AppSize.s1,
            color: ColorManager.white4,
          ),
          AccountItem(title: AppStrings.orders, icon: ImageAssets.orders, onTap: () => onItemPressed(context, index: 0)),
          AccountItem(title: AppStrings.myDetails, icon: ImageAssets.myDetails, onTap: () => onItemPressed(context, index: 1)),
          AccountItem(title: AppStrings.deliveryAddress, icon: ImageAssets.deliveryAddress, onTap: () => onItemPressed(context, index: 2)),
          AccountItem(title: AppStrings.paymentMethods, icon: ImageAssets.payment, onTap: () => onItemPressed(context, index: 3)),
          AccountItem(title: AppStrings.promoCord, icon: ImageAssets.promoCord, onTap: () => onItemPressed(context, index: 4)),
          AccountItem(title: AppStrings.notifications, icon: ImageAssets.notification, onTap: () => onItemPressed(context, index: 5)),
          AccountItem(title: AppStrings.help, icon: ImageAssets.help, onTap: () => onItemPressed(context, index: 6)),
          AccountItem(title: AppStrings.about, icon: ImageAssets.about, onTap: () => onItemPressed(context, index: 7)),
          Divider(
            thickness: AppSize.s1,
            color: ColorManager.white4,
          ),
          const SizedBox(height: AppSize.s50),
          SizedBox(
            width: AppSize.s353,
            height: AppSize.s67,
            child: ElevatedButton(
              onPressed: () {
                _logout();
              },
              style: ElevatedButton.styleFrom(
                primary: ColorManager.darkLightGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.logout, color: ColorManager.primary),
                  const SizedBox(width: AppSize.s100),
                  Text(AppStrings.logOut, style: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.primary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSize.s25),
        ],
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index})
  {
    switch(index)
    {
      case 0:
        break;

      case 1:
        break;

      case 2:
        break;

      case 3:
        break;

      case 4:
        break;

      case 5:
        break;

      case 6:
        break;

      case 7:
        break;
    }
  }

  _logout(){
    _appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
