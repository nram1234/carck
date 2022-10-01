import 'package:carck/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sheardWidgets/custom_listview_item.dart';
import '../../sheardWidgets/tab_bar_item.dart';
import 'controller/home_controller.dart';

class HomeTap2 extends GetView<HomeViwController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: GetBuilder<HomeViwController>(builder: (logic) {
        return Scaffold(
          //appBar: AppBar(backgroundColor: primaryColor,elevation: 0,title: Text("primaryColor")),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: ColorApp.grey.withOpacity(.1),
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("الطلبات", style: TextStyle(fontSize: 17)),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                  children:
                  // List<Widget>.generate(logic.list.length, (int i) {
                  //   return TabBarItem(
                  //     text: logic.list[i],
                  //     isActive: logic.index == i,
                  //     function: () {
                  //       print("ooooooooooooooooooooooooo=>$i");
                  //     logic.updatePageController(i);
                  //     },
                  //   );
                  // }
                  [TabBarItem(
                    text: logic.list[0],
                    isActive: logic.index == 0,
                    function: () {

                      logic.updatePageController(0);
                    },
                  ),TabBarItem(
                    text: logic.list[1],
                    isActive: logic.index == 1,
                    function: () {

                      logic.updatePageController(1);
                    },
                  ),TabBarItem(
                    text: logic.list[2],
                    isActive: logic.index == 2,
                    function: () {

                      logic.updatePageController(2);
                    },
                  )]
                  ),
              Expanded(
                  child: PageView(

                    controller: logic.controller,pageSnapping: false,allowImplicitScrolling: true,
                    onPageChanged:(v){
                      print(v);
                      logic.updatePageController(v);
                    },
                    children: <Widget>[
                      Container(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, pos) {
                                return CustomListViewItem();
                              })),
                      Container(
                          child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, pos) {
                                return CustomListViewItem();
                              })),
                      Container(
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context, pos) {
                                return CustomListViewItem();
                                ;
                              })),
                    ],
                  ))
            ]),
          ),
        );
      }),
    );
  }

  Future<void> _showMyDialog({required BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}