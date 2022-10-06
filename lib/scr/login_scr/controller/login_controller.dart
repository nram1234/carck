

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../netWork/apis/login_api.dart';
import '../../../netWork/models/login_model.dart';

import '../../../push_notifcation.dart';
import '../../../utility/all_string_const.dart';
import '../../../utility/storage.dart';

class LogingController extends GetxController{
  final formKey = GlobalKey<FormState>();
TextEditingController phone=TextEditingController();
TextEditingController password=TextEditingController();

bool islogin=false;
String? nameValidator  (value) {
  if (value == null || value.isEmpty) {
  return 'ادخل اسم الموظف';
  }
  return null;
  }
  String? passwordValidator  (value) {
    if (value == null || value.isEmpty) {
      return 'ادخل كلمة السر';
    }
    return null;
  }


  logIng()async{

    String  firebase_token =
  await  PushNotificationManagger().init();
    print("this is thefirebase_tokenfirebase_token =>${firebase_token} ");
  if(formKey.currentState!.validate()){
    islogin=true;
    update();
    LogInAPI logInAPI=LogInAPI();
    Map <String,dynamic>a={};
    a['phone']  =phone.text;
    a['password']  =password.text;
    a['key']  = '1234567890';
    a['firebase_token']  = firebase_token;

    logInAPI.post(a).then((value) async{

      LogInModel data=value as LogInModel;

      if(data.status==true){

        await SecureStorage.writeSecureJsonData(
            key:AllStringConst.login ,value: data.toJson());
        Get.offAllNamed("Home");
      }else{

        Get.snackbar("", "");
      }
      islogin=false;
update();

    }) ;

  }
  }


  @override
  void onInit() {
    super.onInit();

  }


}