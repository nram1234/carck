import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sheardWidgets/custom_button.dart';
import '../../sheardWidgets/custom_textformfield.dart';
import '../../utility/app_colors.dart';
import 'controller/home_controller.dart';

class HomeTap4 extends GetView<HomeViwController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GetBuilder<HomeViwController>(builder: (logic) {
        return Scaffold(
          //appBar: AppBar(backgroundColor: primaryColor,elevation: 0,title: Text("primaryColor")),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: logic.preparationProfileModel == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(children: [
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: ColorApp.grey.withOpacity(.1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("الملف الشخصي",
                                  style: TextStyle(fontSize: 17)),
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
                      Container(
                        height: 150,
                        width: size.width,
                        child: GestureDetector(
                          onTap: () {
logic.pickImage();



                          },
                          child: Stack(
                            children: [
                              Center(
                                child: logic.image!=null?


                                Container(
                                  width: size.width * .2,
                                  height: size.width * .2,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      image: DecorationImage(
                                          image: FileImage(
                                              logic.image!),fit: BoxFit.fill)),
                                ):logic.imageProfile!=null ?Container(
                                  width: size.width * .2,
                                  height: size.width * .2,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                   image: DecorationImage(fit: BoxFit.fill,
                                          image: NetworkImage(
                                              logic.imageProfile!))),
                                ):







                                Container(
                                  width: size.width * .2,
                                  height: size.width * .2,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/no.jpg"))),
                                ),
                              ),
                              Positioned(
                                right: size.width * .42,
                                top: 100,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                       ),child: Icon(Icons.camera_alt),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الاسم الكامل",
                                style: TextStyle(
                                    color: ColorApp.grey.withOpacity(.7))),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  controller.textEditingControllerProfileName,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide:
                                        BorderSide(color: ColorApp.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("البريد الالكتروني",
                                style: TextStyle(
                                    color: ColorApp.grey.withOpacity(.7))),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  controller.textEditingControllerProfileEmail,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide:
                                        BorderSide(color: ColorApp.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("رقم الجوال",
                                style: TextStyle(
                                    color: ColorApp.grey.withOpacity(.7))),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  controller.textEditingControllerProfilePhone,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide:
                                        BorderSide(color: ColorApp.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Row(
                      //     children: [
                      //       SizedBox(
                      //         width: 8,
                      //       ),
                      //       Expanded(
                      //         child: Column(
                      //           children: [
                      //             Text("الدولة",
                      //                 style: TextStyle(
                      //                     color:
                      //                         ColorApp.grey.withOpacity(.7))),
                      //             SizedBox(
                      //               height: 8,
                      //             ),
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(25),
                      //                   border: Border.all(
                      //                       color: ColorApp.grey, width: 1)),
                      //               child: DropdownButton<String>(
                      //                 value: null,
                      //                 isExpanded: true,
                      //                 icon: const Icon(Icons.arrow_downward),
                      //                 iconSize: 24,
                      //                 elevation: 16,
                      //                 // style: const TextStyle(color: Colors.deepPurple),
                      //                 underline: SizedBox(),
                      //                 onChanged: (String? newValue) {},
                      //                 items: <String>[
                      //                   'One',
                      //                   'Two',
                      //                   'Free',
                      //                   'Four'
                      //                 ].map<DropdownMenuItem<String>>(
                      //                     (String value) {
                      //                   return DropdownMenuItem<String>(
                      //                     value: value,
                      //                     child: Text(value),
                      //                   );
                      //                 }).toList(),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 8,
                      //       ),
                      //       Expanded(
                      //         child: Column(
                      //           children: [
                      //             Text("المدينة",
                      //                 style: TextStyle(
                      //                     color:
                      //                         ColorApp.grey.withOpacity(.7))),
                      //             SizedBox(
                      //               height: 8,
                      //             ),
                      //             Container(
                      //               decoration: BoxDecoration(
                      //                   borderRadius: BorderRadius.circular(25),
                      //                   border: Border.all(
                      //                       color: ColorApp.grey, width: 1)),
                      //               child: DropdownButton<String>(
                      //                 value: null,
                      //                 isExpanded: true,
                      //                 icon: const Icon(Icons.arrow_downward),
                      //                 iconSize: 24,
                      //                 elevation: 16,
                      //                 // style: const TextStyle(color: Colors.deepPurple),
                      //                 underline: SizedBox(),
                      //                 onChanged: (String? newValue) {},
                      //                 items: <String>[
                      //                   'One',
                      //                   'Two',
                      //                   'Free',
                      //                   'Four'
                      //                 ].map<DropdownMenuItem<String>>(
                      //                     (String value) {
                      //                   return DropdownMenuItem<String>(
                      //                     value: value,
                      //                     child: Text(value),
                      //                   );
                      //                 }).toList(),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 8,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("العنوان بالتفصيل",
                                style: TextStyle(
                                    color: ColorApp.grey.withOpacity(.7))),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller:
                                  controller.textEditingControllerProfileAddrs,
                              maxLines: 5,
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                              //validator: controller.nameValidator,controller:controller.username,
                              decoration: InputDecoration(
                                fillColor: ColorApp.grey.withOpacity(.1),
                                filled: true,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: ColorApp.grey),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide:
                                        BorderSide(color: ColorApp.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: ColorApp.grey.withOpacity(.5))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
             logic.saveEd?Center(child: CircularProgressIndicator(),):         CustomButton(
                          height: 50,
                          onClick: () {

                   logic.         EditProfileDetails();



                          },
                          title: "حفظ",
                          buttonColor: ColorApp.LinearGradient2,
                          width: size.width * .9,
                          borderRadius: 25,
                          fontSize: 17),
                      SizedBox(
                        height: 8,
                      ),
                    ]),
            ),
          ),
        );
      }),
    );
  }
}
