import 'package:e_commerce_admin_panel/features/shop/models/order_model.dart';
import 'package:e_commerce_admin_panel/utils/constants/enums.dart';
import 'package:e_commerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  final RxList<double> weeklySales = <double>[].obs;

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2024, 5, 20),
      deliveryDate: DateTime(2024, 5, 20),
    ),
    OrderModel(
      id: 'CWT0013',
      status: OrderStatus.processing,
      totalAmount: 300,
      orderDate: DateTime(2024, 5, 20),
      deliveryDate: DateTime(2024, 5, 20),
    ),
    OrderModel(
      id: 'CWT0014',
      status: OrderStatus.shipped,
      totalAmount: 666,
      orderDate: DateTime(2024, 5, 20),
      deliveryDate: DateTime(2024, 5, 20),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    super.onInit();
  }

  // Calculate weekly sales
  void _calculateWeeklySales() {
    // Reset weekly Sales to zeros
    weeklySales.value = List<double>.filled(7, 0.0);

    for(var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);
      
      // Check if the order is within the current week
      if(orderWeekStart.isBefore(DateTime.now()) && orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;
        
      }
    }
  }
}