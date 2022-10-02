import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sheardWidgets/custom_button.dart';
import '../../../sheardWidgets/custom_textformfield.dart';
import '../../../utility/app_colors.dart';

class LogInSCR extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.5), BlendMode.srcOver),
                  image: AssetImage(
                    "assets/login2.png",
                  ),
                  fit: BoxFit.fill)),
          child: Align(alignment: Alignment.bottomCenter,
            child:  Container( height: size.height*.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(

                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.right,
                          //validator: controller.nameValidator,controller:controller.username,
                          decoration: InputDecoration(hintText: "اسم المستخدم / البريد الالكتروني",
                            fillColor: ColorApp.grey.withOpacity(.1),
                            filled: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: ColorApp.grey),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                borderSide: BorderSide(color: ColorApp.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                borderSide: BorderSide(
                                    color: ColorApp.grey.withOpacity(.0))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ColorApp.grey.withOpacity(.0))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
obscureText: true,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.right,
                          //validator: controller.nameValidator,controller:controller.username,
                          decoration: InputDecoration(hintText: "كلمة المرور",
                            fillColor: ColorApp.grey.withOpacity(.1),
                            filled: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: ColorApp.grey),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                borderSide: BorderSide(color: ColorApp.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                borderSide: BorderSide(
                                    color: ColorApp.grey.withOpacity(.0))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: ColorApp.grey.withOpacity(.0))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              " نسيت كلمة المرور ؟",
                              style:
                              TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          width: double.infinity,
                          height: 50,
                          title: "تسجيل الدخول",
                          onClick: () {
                            Get.offAllNamed("Home");
                          },
                          buttonColor: ColorApp.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        )
                      ]),
                )),
          )),
    );
  }
}
