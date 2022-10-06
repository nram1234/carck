


import 'package:get/get.dart';

import '../login_scr/controller/login_controller.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LogingController>(LogingController());
  }
}
