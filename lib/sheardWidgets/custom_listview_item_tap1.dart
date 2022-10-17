import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../netWork/models/home_model.dart';
import '../scr/home/controller/home_controller.dart';
import '../utility/all_enum_class.dart';
import '../utility/app_colors.dart';
import '../utility/my_custom_navigator.dart';
import 'custom_button.dart';

class CustomListViewItemTap1 extends StatelessWidget {
  ItemListType itemListType;
  DetailsOrders detailsOrders;

  CustomListViewItemTap1(
      {required this.itemListType, required this.detailsOrders });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(detailsOrders.date ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      detailsOrders.idOrder.toString(),
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
                      detailsOrders.totalPrice.toString(),
                      textAlign: TextAlign.right,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "اجمالي القيمة",
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
                      detailsOrders.totalProduct ?? "",
                      textAlign: TextAlign.right,
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      "عدد المنتجات",
                      textAlign: TextAlign.right,
                    )),
              ],
            ),
            itemType(size: size,
                item: itemListType,
                context: context,
                id_order: detailsOrders.idOrder)
          ]),
    );
  }

  Widget itemType({required ItemListType item,
    required Size size,
    required BuildContext context, required id_order}) {
    switch (item) {
      case ItemListType.waiting:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<HomeViwController>(id:id_order.toString() ,
                  builder: (logic) {
                    return logic.isGetOrderDetails?Center(child: CircularProgressIndicator(),): CustomButton(
                      width: size.width * .25,
                      title: "تفاصيل الطلب",
                      titleColor: ColorApp.redColor,
                      onClick: () {
                        logic.getGetOrderDetails(itemListType:item ,updateId:id_order.toString()  ,
                            id_order: id_order, size: size, context: context);
                      },
                      fontWeight: FontWeight.bold,
                      buttonColor: Colors.transparent,
                    );
                  }),
              CustomButton(
                width: size.width * .25,
                title: "قبول الطلب",
                onClick: () {




                },
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
            GetBuilder<HomeViwController>(id: id_order.toString(),
                builder: (logic) {
                  return logic.isGetOrderDetails?Center(child: CircularProgressIndicator(),): CustomButton(
                    width: size.width * .25,
                    title: "تفاصيل الطلب",
                    titleColor: ColorApp.redColor,
                    onClick: () {
                      logic.getGetOrderDetails(itemListType: item,
                          id_order: id_order, size: size, context: context,updateId:id_order.toString());
                    },
                    fontWeight: FontWeight.bold,
                    buttonColor: Colors.transparent,
                  );
                }),
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
            GetBuilder<HomeViwController>(id:id_order.toString() ,
                builder: (logic) {
                  return logic.isGetOrderDetails?Center(child: CircularProgressIndicator(),): CustomButton(
                    width: size.width * .25,
                    title: "تفاصيل الطلب",
                    titleColor: ColorApp.redColor,
                    onClick: () {
                     logic.getGetOrderDetails(itemListType: item,
                          id_order: id_order, size: size, context: context,updateId: id_order.toString());
                    },
                    fontWeight: FontWeight.bold,
                    buttonColor: Colors.transparent,
                  );
                }),
          ],
        );
    }
  }
}
