import 'package:e_commerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_admin_panel/features/authentication/controllers/forget_password_controller.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:e_commerce_admin_panel/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: TSizes.spaceBtwSections * 2),
    
        /// Form
        Form(
          key: controller.forgetPasswordFormKey,
          child: TextFormField(
            controller: controller.email,
            validator: TValidator.validateEmail,
            decoration: InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
    
        /// Submit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.sendPasswordResetEmail(), 
            //Get.toNamed(TRoutes.resetPassword, parameters: {'email': 'some@email.com'}),
            child: const Text(TTexts.submit)
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections * 2),
      ],
    );
  }
}