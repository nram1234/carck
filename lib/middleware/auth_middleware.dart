import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utility/all_string_const.dart';
import '../utility/storage.dart';

class AuthMiddleWare extends GetMiddleware {
 // final SecureStorage _secureStorage = SecureStorage();

  @override
  RouteSettings? redirect(String? route) {
    print("token in start ${SecureStorage.readSecureData(AllStringConst.id)}");
    if (SecureStorage.readSecureData(AllStringConst.id) != null) {
      return const RouteSettings(name: "/Home");

    }
  }
}
