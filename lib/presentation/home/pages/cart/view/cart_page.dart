import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/components/cart_button.dart';

import '../../../../../core/utils/cart_dummy.dart';
import '../../../../components/cart_item.dart';
import '../../../../components/divider_widget.dart';
import '../../../../resources/values_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWidget(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => CartItem(
                  map: cartList[index], index: index, length: cartList.length),
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p25),
                    child: DividerWidget(),
                  ),
              itemCount: cartList.length),
        ),
        const CartButton(),
        const SizedBox(height: AppSize.s25),
      ],
    );
  }
}
