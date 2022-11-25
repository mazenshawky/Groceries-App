import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: AppPadding.p19, right: AppPadding.p31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              AppStrings.seeAll,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
