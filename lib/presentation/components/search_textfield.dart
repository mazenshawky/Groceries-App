import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelMedium,
      keyboardType: TextInputType.text,
      controller: searchController,
      cursorColor: ColorManager.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.darkLightGrey,
        hintStyle:
            getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.grey),
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
    );
  }
}
