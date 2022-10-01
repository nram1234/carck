import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../scr/home/controller/home_controller.dart';
import '../utility/all_enum_class.dart';
import '../utility/app_colors.dart';
import 'custom_button.dart';

class CustomListViewItem extends StatelessWidget {
  ItemListType itemListType;

  CustomListViewItem({required this.itemListType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          // color: Colors.cyan,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
            Text("1-12-2021"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "2-10-2022",
                      textAlign: TextAlign.right,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "رقم الطلب",
                      textAlign: TextAlign.right,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "2-10-2022",
                      textAlign: TextAlign.right,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "موعد التسليم",
                      textAlign: TextAlign.right,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      "2-10-2022",
                      textAlign: TextAlign.right,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "حالة الطلب",
                      textAlign: TextAlign.right,
                    )),
              ],
            ),
            itemType(size: size, item: itemListType, context: context)
          ])),
    );
  }

  Widget itemType(
      {required ItemListType item,
      required Size size,
      required BuildContext context}) {
    switch (item) {
      case ItemListType.waiting:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: size.width * .25,
                title: "تفاصيل الطلب",
                onClick: () {
                  Get.find<HomeViwController>()
                      .customBottomSheet(size: size, context: context);
                  // Get.find<HomeViwController>()
                  //     .customBottomSheet2(size: size );
                },
                fontWeight: FontWeight.bold,
                buttonColor: Colors.transparent,
                titleColor: ColorApp.redColor,
              ),
              CustomButton(
                width: size.width * .25,
                title: "قبول الطلب",
                onClick: () {},
                fontWeight: FontWeight.bold,
                buttonColor: ColorApp.greenColor,
              ),
              CustomButton(
                width: size.width * .25,
                title: "رفض الطلب",
                onClick: () {},
                fontWeight: FontWeight.bold,
                buttonColor: ColorApp.redColor,
              ),
            ],
          ),
        );

      case ItemListType.employment:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: size.width * .25,
              title: "تفاصيل الطلب",
              titleColor: ColorApp.redColor,
              onClick: () {},
              fontWeight: FontWeight.bold,
              buttonColor: Colors.transparent,
            ),
            CustomButton(
              width: size.width * .25,
              title: "تسلبم الطلب",
              onClick: () {},
              fontWeight: FontWeight.bold,
              buttonColor: ColorApp.greenColor,
            ),
          ],
        );
      case ItemListType.finished:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              width: size.width * .25,
              title: "تفاصيل الطلب",
              titleColor: ColorApp.redColor,
              onClick: () {},
              fontWeight: FontWeight.bold,
              buttonColor: Colors.transparent,
            ),
          ],
        );
    }
  }
}
