import 'package:flutter/material.dart';

import '../../../sheardWidgets/custom_button.dart';
import '../../../sheardWidgets/custom_textformfield.dart';
import '../../../utility/app_colors.dart';

class LogInSCR extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      ColorApp.primaryColor.withOpacity(.5), BlendMode.srcOver),
                  image: AssetImage(
                    "assets/login.png",
                  ),
                  fit: BoxFit.fill)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    CustomTextFormField(
                        title: "اسم المستخدم",
                        textEditingController: textEditingController,
                        borderColor: Colors.white,
                        textColor: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        title: "كلمة المرور",
                        obscureText: true,
                        textEditingController: textEditingController,
                        borderColor: Colors.white,
                        textColor: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          " نسيت كلمة المرور ؟",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      width: double.infinity,
                      height: 50,
                      title: "تسجيل الدخول",
                      onClick: () {},
                      buttonColor: ColorApp.primaryColor,fontWeight: FontWeight.bold,fontSize: 17,
                    )
                  ]),
            ),
          )),
    );
  }
}
