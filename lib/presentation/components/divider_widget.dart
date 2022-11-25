import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: AppSize.s1,
      color: ColorManager.white4,
    );
  }
}
