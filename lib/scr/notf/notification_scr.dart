import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification_controller.dart';

class NotificationSCR extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("تنبيهات"), actions: []),
        body: RefreshIndicator(onRefresh: controller.onRefresh ,
          child: GetBuilder<NotificationController>(builder: (logic) {

            return
              logic.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                :
            ListView.builder(controller: logic.scrollController,
                    itemCount: logic.allNotifications?.length,
                    itemBuilder: (context, pos) {
                      return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //           image: AssetImage("assets/aler.png"))),
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(logic .allNotifications![pos].title!),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      // Container(
                                      //   height: 20,
                                      //   width: 20,
                                      //   decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //     image: AssetImage(
                                      //       "assets/clock.png",
                                      //     ),
                                      //   )),
                                      // ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(logic .allNotifications![pos].body!)
                                    ],
                                  ),
                                ],
                              ))
                            ],
                          ));
                    });
          }),
        ));
  }
}
