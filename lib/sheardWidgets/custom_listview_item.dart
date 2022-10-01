
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import 'custom_button.dart';

class CustomListViewItem extends StatelessWidget {
 
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
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CustomButton(
                      width: size.width * .25,
                      title: "تفاصيل الطلب",
                      onClick: () {},fontWeight: FontWeight.bold,
                      buttonColor:ColorApp.redColor,
                    )  ,     CustomButton(
                      width: size.width * .25,
                      title: "تفاصيل الطلب",
                      onClick: () {},fontWeight: FontWeight.bold,
                      buttonColor: ColorApp.greenColor,
                    ),   CustomButton(
                      width: size.width * .25,
                      title: "تفاصيل الطلب",titleColor: ColorApp.redColor,
                      onClick: () {},fontWeight: FontWeight.bold,
                      buttonColor: Colors.transparent,
                    )   ],
                )
              ])),
    );
  }
}
