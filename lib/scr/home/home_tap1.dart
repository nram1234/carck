import 'package:flutter/material.dart';

import '../../sheardWidgets/custom_button.dart';
import '../../sheardWidgets/custom_listview_item.dart';
import '../../utility/app_colors.dart';

class HomeTap1 extends StatelessWidget {
  const HomeTap1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(children: [
        Container(
          width: size.width,
          height: size.height * .5,
          decoration: BoxDecoration(
            color: ColorApp.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, right: 20),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(Icons.notifications_active_outlined),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("مرحبا",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text("محمد احمد",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "الرصيد المتاح",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "200  ريال",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
            ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "طلبات جديدة",
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, pos) {
                return CustomListViewItem();
              }),
        ))
      ]),
    );
  }
}
