import 'package:e_commerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Cards
              TDashboardCard(title: 'Sales Total', subTitle: '\$365.6', stats: 25),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(title: 'Sales Total', subTitle: '\$365.6', stats: 25),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(title: 'Sales Total', subTitle: '\$365.6', stats: 25),
              const SizedBox(height: TSizes.spaceBtwItems),
              TDashboardCard(title: 'Sales Total', subTitle: '\$365.6', stats: 25)
            ],
          ),
        ),
      ),
    );
  }
}