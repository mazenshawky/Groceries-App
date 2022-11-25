import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';

class CarrotWidget extends StatelessWidget {
  const CarrotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(ImageAssets.logoOrangeSmall));
  }
}
