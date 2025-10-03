import 'package:e_commerce_admin_panel/bindings/general_bindings.dart';
import 'package:e_commerce_admin_panel/routes/app_routes.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:e_commerce_admin_panel/utils/constants/text_strings.dart';
import 'package:e_commerce_admin_panel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoute.pages,
      initialBinding: GeneralBindings(),
      initialRoute: TRoutes.dashboard,
      unknownRoute: GetPage(name: '/page-not-found', page: () => const Scaffold(body: Center(child: Text('Page Not Found')))),
    );
  }
}

