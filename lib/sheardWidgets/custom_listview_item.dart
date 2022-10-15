import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../netWork/models/get_waiting_orders.dart';
import '../netWork/models/home_model.dart';
import '../scr/home/controller/home_controller.dart';
import '../utility/all_enum_class.dart';
import '../utility/app_colors.dart';
import 'custom_button.dart';

class CustomListViewItem extends StatelessWidget {
  ItemListType itemListType;
  DetailsOrder? detailsOrders;

  CustomListViewItem({required this.itemListType, this.detailsOrders});

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
            // Text(detailsOrders!.date!),
            Directionality(textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Expanded(
                    flex: 1,
                    child: Text(
                      "رقم الطلب",
                      textAlign: TextAlign.right,
                    )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        detailsOrders!.idOrder.toString(),
                        textAlign: TextAlign.right,
                      )),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Expanded(
                  flex: 1,
                  child: Text(
                    "عدد المنتجات",
                    textAlign: TextAlign.right,
                  )),
                Expanded(
                    flex: 3,
                    child: Text(
                      detailsOrders!.totalProduct!,
                      textAlign: TextAlign.right,
                    )),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Expanded(
                  flex: 1,
                  child: Text(
                    "الاجمالي",
                    textAlign: TextAlign.right,
                  )),
                Expanded(
                    flex: 3,
                    child: Text(
                      detailsOrders!.totalPrice!,
                      textAlign: TextAlign.right,
                    )),

              ],
            ),
            itemType(size: size, item: itemListType, context: context)
          ]),
    );
  }

  Widget itemType({required ItemListType item,
    required Size size,
    required BuildContext context}) {
    switch (item) {
      case ItemListType.waiting:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GetBuilder<HomeViwController>(
                  id: detailsOrders!.idOrder.toString(), builder: (logic) {
                return logic.isGetOrderDetails ? Center(
                  child: CircularProgressIndicator(),) : CustomButton(
                  width: size.width * .25,
                  title: "تفاصيل الطلب",
                  onClick: () {
                    logic.getGetOrderDetails(
                        updateId: detailsOrders!.idOrder.toString(),
                        id_order: detailsOrders!.idOrder,
                        size: size,
                        context: context);


                    // Get.find<HomeViwController>()
                    //     .getGetOrderDetails(size: size,
                    //   context: context,
                    //   id_order: detailsOrders!.idOrder!,);
                    // Get.find<HomeViwController>()
                    //     .customBottomSheet2(size: size );
                  },
                  fontWeight: FontWeight.bold,
                  buttonColor: Colors.transparent,
                  titleColor: ColorApp.redColor,
                );
              }),
              GetBuilder<HomeViwController>(
                  id: detailsOrders!.idOrder.toString(),
                  builder: (logic) {
                    return logic.isChangeStatusOrder ? Center(
                      child: CircularProgressIndicator(),) : CustomButton(
                      width: size.width * .25,
                      title: "قبول الطلب",
                      onClick: () {
                        print("detailsOrders!.idOrder    ${detailsOrders!
                            .idOrder}");
                        logic.getChangeStatusOrder(
                            updateId: detailsOrders!.idOrder.toString(),
                            id_order: detailsOrders!.idOrder, action: 1);
                      },
                      fontWeight: FontWeight.bold,
                      buttonColor: ColorApp.greenColor,
                    );
                  }),
              GetBuilder<HomeViwController>(
                  id: detailsOrders!.idOrder.toString(),
                  builder: (logic) {
                    return logic.isGetOrderDetails ? Center(
                      child: CircularProgressIndicator(),) : CustomButton(
                      width: size.width * .25,
                      title: "رفض الطلب",
                      onClick: () {
                        logic.getChangeStatusOrder(
                            updateId: detailsOrders!.idOrder.toString(),
                            id_order: detailsOrders!.idOrder, action: 0);
                      },
                      fontWeight: FontWeight.bold,
                      buttonColor: ColorApp.redColor,
                    );
                  }),
            ],
          ),
        );

      case ItemListType.employment:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<HomeViwController>(
                id: detailsOrders!.idOrder.toString(), builder: (logic) {
              return logic.isGetOrderDetails ? Center(
                child: CircularProgressIndicator(),) : CustomButton(
                width: size.width * .25,
                title: "تفاصيل الطلب",
                titleColor: ColorApp.redColor,
                onClick: () {
                  logic.getGetOrderDetails(
                      updateId: detailsOrders!.idOrder.toString(),
                      id_order: detailsOrders!.idOrder,
                      size: size,
                      context: context);
                },
                fontWeight: FontWeight.bold,
                buttonColor: Colors.transparent,
              );
            }),
            GetBuilder<HomeViwController>(
                id: detailsOrders!.idOrder.toString(), builder: (logic) {
              return logic.isGetOrderDetails ? Center(
                child: CircularProgressIndicator(),) :CustomButton(
                    width: size.width * .25,
                    title: "تسلبم الطلب",
                    onClick: () {
                      print("detailsOrders!.idOrder    ${detailsOrders!
                          .idOrder}");
                      logic.getChangeStatusOrder(
                          updateId: detailsOrders!.idOrder.toString(),
                          id_order: detailsOrders!.idOrder, action: 1);
                    },
                    fontWeight: FontWeight.bold,
                    buttonColor: ColorApp.greenColor,
                  );
                }),
          ],
        );
      case ItemListType.finished:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<HomeViwController>(
                id: detailsOrders!.idOrder.toString(), builder: (logic) {
              return logic.isGetOrderDetails ? Center(
                child: CircularProgressIndicator(),) : CustomButton(
                width: size.width * .25,
                title: "تفاصيل الطلب",
                titleColor: ColorApp.redColor,
                onClick: () {
                  logic.getGetOrderDetails(
                      updateId: detailsOrders!.idOrder.toString(),
                      id_order: detailsOrders!.idOrder,
                      size: size,
                      context: context);
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
