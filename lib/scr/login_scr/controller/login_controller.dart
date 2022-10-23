

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

    var  firebase_token =
  await  PushNotificationManagger().init();

  if(formKey.currentState!.validate()){
    islogin=true;
    update();
    LogInAPI logInAPI=LogInAPI();
    PushNotificationManagger().init().then((value) {


      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk   ${value}");
      Map <String,dynamic>a={};
      a['phone']  =phone.text;
      a['password']  =password.text;
      a['key']  = '1234567890';
      a['firebase_token']  = value;

      logInAPI.post(a).then((value) async{

        LogInModel data=value as LogInModel;

        if(data.status==true){
          await  SecureStorage.writeSecureDataINT(key: AllStringConst.id , value: data.result!.agentData![0].id!);
          // await SecureStorage.writeSecureJsonData(
          //     key:AllStringConst.login ,value: data.toJson());
          Get.offAllNamed("Home");
        }else{

          Get.snackbar("", data.message!);
        }
        islogin=false;
        update();

      }) ;
    });


  }
  }


  @override
  void onInit() {
    super.onInit();

  }


}