import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/explore_widget.dart';
import 'package:groceries_app/presentation/components/search_textfield.dart';

import '../../../../../core/utils/explore_dummy.dart';
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
      padding:
          const EdgeInsets.only(left: AppPadding.p24, right: AppPadding.p25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: AppSize.s15),
            SearchTextField(searchController: _searchController),
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
                (index) => ExploreWidget(
                    title: exploreMap['titles']![index],
                    image: exploreMap['images']![index],
                    color: exploreMap['colors']![index],
                    borderColor: exploreMap['borderColors']![index]),
              ),
            ),
            const SizedBox(height: AppSize.s15),
          ],
        ),
      ),
    );
  }
}
