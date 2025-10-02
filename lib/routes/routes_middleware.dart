import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    
    final isAuthenticated = false;
    return isAuthenticated ? null : const RouteSettings(name: TRoutes.login);
  }
}