import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: ColorManager.black,
      ),
    );
  }
}
