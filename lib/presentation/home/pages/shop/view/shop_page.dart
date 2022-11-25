import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/card_widget.dart';
import 'package:groceries_app/presentation/components/carrot_widget.dart';
import 'package:groceries_app/presentation/components/category_widget.dart';
import 'package:groceries_app/presentation/components/search_textfield.dart';

import '../../../../../core/utils/shop_dummy.dart';
import '../../../../components/address_widget.dart';
import '../../../../components/banner_widget.dart';
import '../../../../components/title_component.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p58),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CarrotWidget(),
            const SizedBox(height: AppSize.s5),
            const AddressWidget(),
            const SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p24, right: AppPadding.p25),
              child: SearchTextField(searchController: _searchController),
            ),
            const SizedBox(height: AppSize.s15),
            const Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p23_5, right: AppPadding.p23_5),
              child: BannerWidget(),
            ),
            const SizedBox(height: AppSize.s40),
            const TitleComponent(title: AppStrings.exclusiveOffer),
            const SizedBox(height: AppSize.s26),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p19, right: AppPadding.p19),
              child: SizedBox(
                height: AppSize.s248_5,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CardWidget(map: exclusiveList[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: AppSize.s15),
                  itemCount: exclusiveList.length,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s50),
            const TitleComponent(title: AppStrings.bestSelling),
            const SizedBox(height: AppSize.s26),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p19, right: AppPadding.p19),
              child: SizedBox(
                height: AppSize.s248_5,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CardWidget(map: bestSellingList[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: AppSize.s15),
                  itemCount: bestSellingList.length,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s50),
            const TitleComponent(title: AppStrings.groceries),
            const SizedBox(height: AppSize.s26),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p19, right: AppPadding.p19),
              child: SizedBox(
                height: AppSize.s105,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CategoryWidget(map: categories[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: AppSize.s10),
                  itemCount: categories.length,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s12),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p19, right: AppPadding.p19),
              child: SizedBox(
                height: AppSize.s248_5,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CardWidget(map: groceriesList[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: AppSize.s15),
                  itemCount: groceriesList.length,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s20),
          ],
        ),
      ),
    );
  }
}
