import 'package:flutter/material.dart';

import '../resources/values_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s353,
      height: AppSize.s67,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          label,
        ),
      ),
    );
  }
}
