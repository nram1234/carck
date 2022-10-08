import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sheardWidgets/custom_button.dart';
import '../../../sheardWidgets/custom_textformfield.dart';
import '../../../utility/app_colors.dart';
import '../controller/login_controller.dart';

class LogInSCR extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: size.height * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GetBuilder<LogingController>(builder: (logic) {
                    return Form(key:logic.formKey,
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
                            TextFormField( controller:  logic.phone,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                hintText: "رقم التلفون",
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey)),
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
                            TextFormField(controller: logic.password,
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                hintText: "كلمة المرور",
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey)),
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
                          logic.islogin?const Center(child: CircularProgressIndicator(),):  CustomButton(
                              width: double.infinity,
                              height: 50,
                              title: "تسجيل الدخول",
                              onClick:logic.logIng,
                              buttonColor: ColorApp.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            )
                          ]),
                    );
                  }),
                )),
          )),
    );
  }
}
