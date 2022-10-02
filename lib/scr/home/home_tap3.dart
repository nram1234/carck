import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';
import 'controller/home_controller.dart';

class HomeTap3 extends GetView<HomeViwController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      GestureDetector(
                          onTap: () {
                            controller.changeSelectedValue(0);
                          },
                          child: Icon(Icons.arrow_forward)),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                            colors: [
                              ColorApp.LinearGradient2,
                              ColorApp.LinearGradient1,
                            ],
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text("الرصيد المتاح",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("200",
                                  style: TextStyle(
                                      fontSize: 52, color: Colors.white)),
                              SizedBox(
                                width: 10,
                              ),
                              Text("ريال",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                            ],
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 20, left: 20, bottom: 5),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text("العمليات السابقة",
                        style: TextStyle(fontSize: 19))),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, left: 20, bottom: 5),
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, pos) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(14),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: ColorApp.grey.withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset("assets/bu.png"),
                                  ),SizedBox(width: 8,),
                                  Expanded(
                                      child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("تسليم طلب #123456",
                                          style: TextStyle(fontSize: 14)),
                                      Text("10-6-2022",
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ))
                               ,

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                         style: TextStyle(color: Colors.black, fontSize: 20),
                                          children: <TextSpan>[
                                            TextSpan(text: '30 ', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                            TextSpan(text: 'ريال ', style: TextStyle(color: Colors.black)),

                                          ],
                                        ),
                                        textScaleFactor: 0.5,
                                      ),
                                      GestureDetector(onTap: (){
                                        controller.customBottomSheet(size: size, context: context);
                                      },
                                        child: Text("تفاصيل الطلب",
                                            style: TextStyle(fontSize: 12,color: ColorApp.primaryColor)),
                                      )
                                    ],
                                  )],
                              )),
                        );
                      }),
                ),
              ),
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
