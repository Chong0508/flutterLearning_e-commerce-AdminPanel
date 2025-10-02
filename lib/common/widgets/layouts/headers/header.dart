import 'package:e_commerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:e_commerce_admin_panel/utils/constants/image_strings.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// Header widget for the application 
class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({
    super.key,
    this.scaffoldKey
  });

  /// GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.white,
        border: Border(bottom: BorderSide(color: TColors.grey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /// Mobile Menu
        leading: !TDeviceUtils.isDesktopScreen(context) 
            ? IconButton(onPressed: () => scaffoldKey?.currentState?.openDrawer(), icon: const Icon(Iconsax.menu)) 
            : null,
        
        /// Search Field
        title: TDeviceUtils.isDesktopScreen(context) ? SizedBox(
          width: 400,
          child: TextFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: 'Search anything...'),
          ),
        ) : null,

        /// Actions
        actions: [
          // Search Icon on Mobile
          if(!TDeviceUtils.isDesktopScreen(context)) IconButton(onPressed: () {}, icon: const Icon(Iconsax.search_normal)),

          // Notification Icon
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(width: TSizes.spaceBtwItems/2),

          // User Data
          Row(
            children: [
              // Image
              TRoundedImage(
                width: 40,
                padding: 2,
                height: 40,
                imageType: ImageType.asset, 
                image: TImages.user
              ),
              SizedBox(width: TSizes.sm),
            
              // Name and Email
              if(!TDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CMK', style: Theme.of(context).textTheme.titleLarge),
                    Text('cmk@gmail.com', style: Theme.of(context).textTheme.labelMedium),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}