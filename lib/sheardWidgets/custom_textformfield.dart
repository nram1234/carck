import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  double height;
  TextEditingController textEditingController;
  Color textColor;
  Color borderColor;
String title;
bool obscureText;
  CustomTextFormField(
      {this.height = 50,required this.title,
      required this.textEditingController,
      required this.textColor,this.obscureText=false,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: TextFormField(obscureText:obscureText ,
          controller: textEditingController,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.right,
          //validator: controller.nameValidator,controller:controller.username,
          decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(.2),filled: true,
            border: InputBorder.none,
            hintText:title,
            hintStyle: TextStyle(color: Colors.white),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
