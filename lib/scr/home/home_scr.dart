import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import 'controller/home_controller.dart';
import 'home_tap1.dart';

class HomeSCR extends GetView<HomeViwController> {
  const HomeSCR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViwController>(
        builder: (logic) {
          return Scaffold(
            body: logic.currentScreen,
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                onTap: logic.changeSelectedValue,
                // logic.chingePage,
                selectedItemColor: ColorApp.primaryColor,
                currentIndex: logic.navigatorValue,
                //logic.index,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,

                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home), label: "الرئيسية"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.explore), label: "طلباتي"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance_wallet),
                      label: "المحفظة"),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person), label: "الملف الشخصي")
                ],
              ),
            ),
          );
        });
  }
}
