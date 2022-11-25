import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/favourtie_item.dart';

import '../../../../../core/utils/favourite_dummy.dart';
import '../../../../components/default_button.dart';
import '../../../../components/divider_widget.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWidget(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => FavouriteItem(
              map: favouriteList[index],
              index: index,
              length: favouriteList.length,
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p25),
              child: DividerWidget(),
            ),
            itemCount: favouriteList.length,
          ),
        ),
        const DefaultButton(label: AppStrings.addAllToCart),
        const SizedBox(height: AppSize.s25),
      ],
    );
  }
}
