import 'package:flutter/material.dart';
class ColorApp{

static Color primaryColor  =  HexColor("#EFB773");
static Color primary2Color  =  HexColor("#C99F6D");
static Color   accentColor   = HexColor('#D4AA3A');
static Color greenColor =  HexColor("#84F397");
static Color redColor =  HexColor("#F8A089");
static Color lastItemInHome =  HexColor("#D1A26E");
static Color lightB =  Color(0xff98d2e8);
static Color whiteColor =  Color(0xfff5f5f5);
static Color blackFontColor =  Color(0xfff303952);
static Color lightGreyColor =  Color.fromRGBO(223,223,223,1);
static Color lightGreyColor2 =  Color(0xffcbcbcb);
static Color lightGreyColor3=  Color(0xffeceaea);
static Color grey=  Color(0xff888888);







}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}