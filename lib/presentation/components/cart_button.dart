import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/total_price_widget.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s353,
      height: AppSize.s67,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(width: AppSize.s70),
            Text(AppStrings.goToCheckout),
            SizedBox(width: AppSize.s47_5),
            TotalPriceWidget(),
          ],
        ),
      ),
    );
  }
}
