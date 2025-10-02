import 'package:e_commerce_admin_panel/common/styles/spacing_styles.dart';
import 'package:e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

/// Template for the login page layout
class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({
    super.key,
    required this.child
  });

  /// The widget to be displayed inside the login template
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: dark ? TColors.black : TColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
