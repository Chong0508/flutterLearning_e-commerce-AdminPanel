import 'package:e_commerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteObservers extends GetObserver{
  
  @override
  // To enable back to previous button function
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if(previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for(var routeName in TRoutes.sideMenuItems) {
        if(previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if(route != null) {
      // Check the route name and update the active item 
      for(var routeName in TRoutes.sideMenuItems) {
        if(route.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
  
}