


import 'package:get/get.dart';

import '../../notf/notification_controller.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeViwController>(HomeViwController());
    Get.lazyPut <NotificationController>(() =>NotificationController());

  }
}
