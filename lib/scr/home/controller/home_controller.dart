import 'dart:io';
import 'package:dio/dio.dart';

import 'package:carck/scr/home/home_tap1.dart';
import 'package:carck/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:image_picker/image_picker.dart';

import '../../../netWork/apis/change_status_order_api.dart';
import '../../../netWork/apis/edit_profile_api.dart';
import '../../../netWork/apis/get_current_orders_api.dart';
import '../../../netWork/apis/get_data_info_api.dart';
import '../../../netWork/apis/get_order_details_api.dart';
import '../../../netWork/apis/get_received_orders_api.dart';
import '../../../netWork/apis/get_waiting_orders_api.dart';
import '../../../netWork/apis/home_api.dart';
import '../../../netWork/apis/preparation_profile_api.dart';
import '../../../netWork/models/edit_profile_model.dart';
import '../../../netWork/models/get_data_info_model.dart';
import '../../../netWork/models/get_order_details_model.dart';
import '../../../netWork/models/get_waiting_orders.dart';
import '../../../netWork/models/home_model.dart';
import '../../../netWork/models/preparation_profile_model.dart';
import '../../../sheardWidgets/custom_button.dart';
import '../../../utility/all_enum_class.dart';
import '../../../utility/all_string_const.dart';
import '../../../utility/storage.dart';
import '../home_tap2.dart';
import '../home_tap3.dart';
import '../home_tap4.dart';

class HomeViwController extends GetxController {
  TextEditingController textEditingControllerProfileName =
  TextEditingController();
  TextEditingController textEditingControllerProfileEmail =
  TextEditingController();
  TextEditingController textEditingControllerProfilePhone =
  TextEditingController();
  TextEditingController textEditingControllerProfileAddrs =
  TextEditingController();

  int _navigatorValue = 0;
  String _currentPage = 'Page1';
  late var _navigatorKey;

  List<String> _pageKeys = ['Page1', 'Page2', 'Page3', 'Page4'];

  get navigatorValue => _navigatorValue;

  get currentPage => _currentPage;

  get navigatorKey => _navigatorKey;

  get navigatorKeys => _navigatorKeys;

  get pageKeys => _pageKeys;
  static final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Page1': GlobalKey<NavigatorState>(),
    'Page2': GlobalKey<NavigatorState>(),
    'Page3': GlobalKey<NavigatorState>(),
    'Page4': GlobalKey<NavigatorState>(),
    // 'Page5': GlobalKey<NavigatorState>(),
  };

  Widget currentScreen = Container();

  @override
  void onInit() {
    super.onInit();
    currentScreen = PageToView(
      naigatorKey: _navigatorKeys[_pageKeys[0]]!,
      tabItem: _pageKeys[0],
    ); //=HomeView();
    getHomedata();
    getDataInfodata();
  }

  HomeModel? homeModel;

  getHomedata() async {
    HomeAPI homeAPI = HomeAPI();

    Map<String, dynamic> a = {};
    a['id_agent'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    homeAPI.post(a).then((value) {
      homeModel = value as HomeModel;
      update();
    });
  }

  PreparationProfileModel? preparationProfileModel;
  String? imageProfile;

  getpreparationProfiledata() async {
    GetPreparationProfileAPI getPreparationProfileAPI =
    GetPreparationProfileAPI();

    Map<String, dynamic> a = {};
    a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    getPreparationProfileAPI.post(a).then((value) {
      preparationProfileModel = value as PreparationProfileModel;

      textEditingControllerProfileName.text =
          preparationProfileModel?.result?.customerInfo?.name ?? "";
      textEditingControllerProfileEmail.text =
          preparationProfileModel?.result?.customerInfo?.email ?? "";
      textEditingControllerProfilePhone.text =
          preparationProfileModel?.result?.customerInfo?.phone ?? "";
      textEditingControllerProfileAddrs.text =
          preparationProfileModel?.result?.customerInfo?.address ?? "";
      imageProfile = preparationProfileModel?.result?.customerInfo?.img;
      update();
    });
  }

  GetDataInfoModel? getDataInfoModel;

  getDataInfodata() async {
    GetDataInfoAPI getDataInfoAPI = GetDataInfoAPI();

    Map<String, dynamic> a = {};
    a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    getDataInfoAPI.post(a).then((value) {
      print("vvvvvvvvvvvvvvvv${value}");
      getDataInfoModel = value as GetDataInfoModel;
      update();
    });
  }

  bool isGetOrderDetails = false;
  GetOrderDetailsModel? getOrderDetailsModel;

  getGetOrderDetails({required ItemListType itemListType, required id_order,
    required Size size,
    required BuildContext context,
    updateId}) async {
    isGetOrderDetails = true;

// if(updateId!=null){

// }

    update([updateId]);


    GetOrderDetailsAPI homeAPI = GetOrderDetailsAPI();

    Map<String, dynamic> a = {};
    a['id_agent'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';
    a['id_order'] = id_order;
    homeAPI.post(a).then((value) {
      getOrderDetailsModel = value as GetOrderDetailsModel;
      customBottomSheet(
          itemListType: itemListType, size: size, context: context);
      isGetOrderDetails = false;
      update([updateId]);
      //update();
    });
  }

  File? image;

  Future pickImage() async {
    final picker = ImagePicker();
    XFile? img = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 100);
    if (img != null) {
      image = File(img.path);
      update();
    }
    //_cropImage(File(img!.path));
  }

  EditProfileModel? editProfileModel;
  bool saveEd = false;

  EditProfileDetails() async {
    saveEd = true;
    update();

    EditProfileAPI editProfileAPI = EditProfileAPI();

    Map<String, dynamic> a = {};
    a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    a['phone'] = textEditingControllerProfilePhone.text;
    a['name'] = textEditingControllerProfileName.text;
    a['address'] = textEditingControllerProfileAddrs.text;
    a['email'] = textEditingControllerProfileEmail.text;
    if (image != null) {
      String fileName = image!
          .path
          .split('/')
          .last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image!.path, filename: fileName),
      });
      // a['file'] =    await  MultipartFile.fromFile(image!.path,
      //     filename: fileName, //contentType:  MediaType('image', 'png')
      // );

      a['file'] = formData;
    }

    FormData formData = new FormData.fromMap({
      // "mode": "formdata",
      "agent_id": SecureStorage.readSecureDataINT(AllStringConst.id),
      "key": '1234567890',

      'phone': textEditingControllerProfilePhone.text,
      'name': textEditingControllerProfileName.text,
      'address': textEditingControllerProfileAddrs.text,
      'email': textEditingControllerProfileEmail.text,

      "file": await MultipartFile.fromFile(image!.path,
        filename: image!
            .path
            .split('/')
            .last, // contentType: new MediaType('image', 'png')

      ),
    });

    editProfileAPI.postFile(formData).then((value) {
      editProfileModel = value as EditProfileModel;

      saveEd = false;
      update();
      //update();
    });
  }


  // GetDataInfoModel? getDataInfoModel;
  //
  // getDataInfodata() async {
  //   GetDataInfoAPI getDataInfoAPI = GetDataInfoAPI();
  //
  //   Map<String, dynamic> a = {};
  //   a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);
  //
  //   a['key'] = '1234567890';
  //
  //   getDataInfoAPI.post(a).then((value) {
  //     print("vvvvvvvvvvvvvvvv${value}");
  //     getDataInfoModel = value as GetDataInfoModel;
  //     update();
  //   });
  // }


  changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    _currentPage = _pageKeys[selectedValue];
    _navigatorKey = _navigatorKeys[_currentPage];

    currentScreen = PageToView(
      naigatorKey: _navigatorKey,
      tabItem: _currentPage,
    );
    if (selectedValue == 3) {
      print("ljhnfcaoihnfiuaefcneasifnvuiasnviaercv");

      getpreparationProfiledata();
    }

    if (selectedValue == 1) {
      print("ljhnfcaoihnfiuaefcneasifnvuiasnviaercv");

      //getWaitingOrders();
      getReceivedOrders();
      getCurrentOrders();
    }
    update();
  }

  Widget buildoffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: PageToView(
        naigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }

  gotomun() {
    // Get.to(() => MenuView());
  }

  List<String> list = [" حالية", " المستلم", "تم التوصيل"];
  int index = 0;
  PageController controller = PageController(initialPage: 0);

  updatePageController(int i) {
    print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii   =>$i");
    index = i;

    controller.jumpToPage(i);
    // controller.animateToPage(i,
    //     curve: Curves.bounceInOut,
    //     duration: Duration(milliseconds: 200)).then((value) {
    //   update();
    // });
    update();
  }


  // GetWaitingOrdersModel? getWaitingOrdersModel;
  //
  // getWaitingOrders() async {
  //   GetWaitingOrdersAPI getWaitingOrdersAPI = GetWaitingOrdersAPI();
  //
  //   Map<String, dynamic> a = {};
  //   a['id_agent'] = SecureStorage.readSecureDataINT(AllStringConst.id);
  //
  //   a['key'] = '1234567890';
  //
  //   getWaitingOrdersAPI.post(a).then((value) {
  //     getWaitingOrdersModel = value as GetWaitingOrdersModel;
  //     update();
  //   });
  // }


  GetWaitingOrdersModel? currentOrders;

  getCurrentOrders() async {
    GetCurrentOrdersAPI getCurrentOrdersAPI = GetCurrentOrdersAPI();

    Map<String, dynamic> a = {};
    a['id_agent'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    getCurrentOrdersAPI.post(a).then((value) {
      currentOrders = value as GetWaitingOrdersModel;
      print("currentOrderscurrentOrders   ${currentOrders!.result!.detailsOrder!
          .length}");
      update();
    });
  }


  GetWaitingOrdersModel? receivedOrders;

  getReceivedOrders() async {
    GetgReceivedOrdersAPI getgReceivedOrdersAPI = GetgReceivedOrdersAPI();

    Map<String, dynamic> a = {};
    a['id_agent'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';

    getgReceivedOrdersAPI.post(a).then((value) {
      receivedOrders = value as GetWaitingOrdersModel;

      print("rec  ${ receivedOrders?.result?.detailsOrder?.length}");
      update();
    });
  }


  bool isChangeStatusOrder = false;

  getChangeStatusOrder({required id_order,

    updateId, required int action}) async {
    isChangeStatusOrder = true;


    update([updateId]);


    ChangeStatusOrderAPI changeStatusOrderAPI = ChangeStatusOrderAPI();

    Map<String, dynamic> a = {};
    a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);

    a['key'] = '1234567890';
    a['order_id'] = id_order;
    a['status'] = action;
    changeStatusOrderAPI.post(a).then((value) {
      //getWaitingOrders();
      getReceivedOrders();
      getCurrentOrders();
      isChangeStatusOrder = false;
      update([updateId]);
      //update();
    });
  }


  customBottomSheet(
      {required Size size, required context, required ItemListType itemListType}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) {
          return Container(
            height: size.height * .85,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.clear))),
                        Text(
                          "تفاصبل الطلب",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: Card(
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                "الطلب",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "No.#${getOrderDetailsModel!.result!
                                    .orderDetails![0].idOrder}",
                                style: TextStyle(
                                    fontSize: 24, color: ColorApp.blueColor),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${getOrderDetailsModel!.result!
                                            .orderDetails![0].date}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": تاريخ الطلب",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${getOrderDetailsModel!.result!
                                            .orderDetails![0].totalPrice}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": اجمالي الطلب",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${getOrderDetailsModel!.result!
                                            .orderDetails![0].totalProduct}",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": عدد الطلبات",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 8, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "محتويات الطلب",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, pos) {
                  //       return Directionality(textDirection: TextDirection.rtl,
                  //         child: Row(
                  //           children: [
                  //             Image.network(
                  //               "https://5.imimg.com/data5/CM/AV/LJ/SELLER-68434442/designer-bedroom-furniture-1000x1000.jpg",
                  //               width: 50,
                  //               height: 50,
                  //             ),
                  //             Expanded(
                  //                 flex: 3, child: Text("okokjokookokkokkoko")),
                  //             Expanded(
                  //                 flex: 1, child: Text("okokjokookokkokkoko"))
                  //           ],
                  //         ),
                  //       );
                  //     })
                  // ,
                  SizedBox(
                    height: 20,
                  ),
                  ...List<Widget>.generate(
                      getOrderDetailsModel!.result!.allProducts!.length,
                          (i) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 8,
                              child: SizedBox(
                                width: size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Row(
                                            children: [
                                              Image.network(
                                                getOrderDetailsModel!.result!
                                                    .allProducts![i].image!,
                                                width: 75,
                                                height: 75,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                      getOrderDetailsModel!
                                                          .result!
                                                          .allProducts![i]
                                                          .productName!)),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: Text(
                                                          "${getOrderDetailsModel!
                                                              .result!
                                                              .allProducts![i]
                                                              .price}  \$")))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "${getOrderDetailsModel!
                                                      .result!.allProducts![i]
                                                      .providerName}",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  ": اسم البايع",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "${getOrderDetailsModel!
                                                      .result!.allProducts![i]
                                                      .providerAddress}",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  ": عنوان البايع",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: Text(
                                                  "${getOrderDetailsModel!
                                                      .result!.allProducts![i]
                                                      .providerPhone}",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  ": تلفون البايع",
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  textAlign: TextAlign.right,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: Column(
                      children: [
                        // Directionality(
                        //   textDirection: TextDirection.rtl,
                        //   child: Row(
                        //     children: [
                        //       Text("السعر"),
                        //       Spacer(),
                        //       Text(
                        //         "${    getOrderDetailsModel!.result!.orderDetails![0].totalPrice}  \$",
                        //         style: TextStyle(color: ColorApp.primaryColor),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("خدمة التوصيل"),
                              Spacer(),
                              Text(
                                "${getOrderDetailsModel!.result!
                                    .orderDetails![0]
                                    .shippingCharges}  ${getOrderDetailsModel!
                                    .result!.orderDetails![0].currencyName} ",
                                style: TextStyle(
                                    color: ColorApp.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // Directionality(
                        //   textDirection: TextDirection.rtl,
                        //   child: Row(
                        //     children: [
                        //       Text("قسيمة الخصم"),
                        //       Spacer(),
                        //       Text(
                        //         "${getOrderDetailsModel!.result!.orderDetails![0].}  \$",
                        //         style: TextStyle(color: ColorApp.primaryColor),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("الاجمالي"),
                              Spacer(),
                              Text(
                                "${getOrderDetailsModel!.result!
                                    .orderDetails![0].totalPrice}  \$",
                                style: TextStyle(
                                    color: ColorApp.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Text("طريقة الدفع"),
                          Spacer(),
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/200px-Mastercard-logo.svg.png",
                            width: 50,
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  // SizedBox(
                  //   width: size.width * .8,
                  //   child: Directionality(
                  //     textDirection: TextDirection.rtl,
                  //     child: Row(
                  //       children: [
                  //         Text("حاله الطلب"),
                  //         Spacer(),
                  //         Text(
                  //           "قيد الانتظار",
                  //           style: TextStyle(
                  //               color: ColorApp.primaryColor,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),


                  itemType(item: itemListType,
                      size: size,
                      context: context,
                      id_order: getOrderDetailsModel!.result!.orderDetails![0]
                          .idOrder),


                  // fromTapNumber==2?    Directionality(
                  //   textDirection: TextDirection.rtl,
                  //   child:
                  //   GetBuilder<HomeViwController>(id:getOrderDetailsModel!.result!
                  //       .orderDetails![0].idOrder ,
                  //       builder: (logic) {
                  //         return logic.isChangeStatusOrder?Center(child: CircularProgressIndicator(),): CustomButton(
                  //           width: size.width * .25,
                  //           title: "تم التوصيل",
                  //           onClick: () {
                  //             getChangeStatusOrder(
                  //                 updateId: getOrderDetailsModel!.result!
                  //                     .orderDetails![0].idOrder,
                  //                 id_order: getOrderDetailsModel!.result!
                  //                     .orderDetails![0].idOrder, action: 3);
                  //           },
                  //           fontWeight: FontWeight.bold,
                  //           buttonColor: ColorApp.greenColor,
                  //         );
                  //       }),
                  //   // Row(
                  //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   //   children: [
                  //   //     GetBuilder<HomeViwController>(id:getOrderDetailsModel!.result!
                  //   //         .orderDetails![0].idOrder ,
                  //   //         builder: (logic) {
                  //   //           return logic.isChangeStatusOrder?Center(child: CircularProgressIndicator(),): CustomButton(
                  //   //             width: size.width * .25,
                  //   //             title: "قبول الطلب",
                  //   //             onClick: () {
                  //   //               getChangeStatusOrder(
                  //   //                   updateId: getOrderDetailsModel!.result!
                  //   //                       .orderDetails![0].idOrder,
                  //   //                   id_order: getOrderDetailsModel!.result!
                  //   //                       .orderDetails![0].idOrder, action: 1);
                  //   //             },
                  //   //             fontWeight: FontWeight.bold,
                  //   //             buttonColor: ColorApp.greenColor,
                  //   //           );
                  //   //         }),
                  //   //     CustomButton(
                  //   //       width: size.width * .25,
                  //   //       title: "رفض الطلب",
                  //   //       onClick: () {},
                  //   //       fontWeight: FontWeight.bold,
                  //   //       buttonColor: ColorApp.redColor,
                  //   //     ),
                  //   //   ],
                  //   // ),
                  // ):SizedBox(),
                  SizedBox(
                    height: 50,
                  )
                ]),
              ),
            ),
          );
        });
  }


  Widget itemType({required ItemListType item,
    required Size size,
    required BuildContext context, required id_order}) {
    switch (item) {
      case ItemListType.waiting:
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // GetBuilder<HomeViwController>(id:id_order.toString() ,
              //     builder: (logic) {
              //       return logic.isGetOrderDetails?Center(child: CircularProgressIndicator(),): CustomButton(
              //         width: size.width * .25,
              //         title: "تفاصيل الطلب",
              //         titleColor: ColorApp.redColor,
              //         onClick: () {
              //           logic.getGetOrderDetails(itemListType: item,updateId:id_order.toString()  ,
              //               id_order: id_order, size: size, context: context);
              //         },
              //         fontWeight: FontWeight.bold,
              //         buttonColor: Colors.transparent,
              //       );
              //     }),
              GetBuilder<HomeViwController>(
                  id: id_order.toString(),
                  builder: (logic) {
                    return logic.isChangeStatusOrder ? Center(
                      child: CircularProgressIndicator(),) : CustomButton(
                      width: size.width * .25,
                      title: "قبول الطلب",
                      onClick: () {
                        logic.getChangeStatusOrder(

                            updateId: id_order.toString(),
                            id_order: id_order,

                            action: 1);
                      },
                      fontWeight: FontWeight.bold,
                      buttonColor: ColorApp.greenColor,
                    );
                  }),
              CustomButton(
                width: size.width * .25,
                title: "رفض الطلب",
                onClick: () {},
                fontWeight: FontWeight.bold,
                buttonColor: ColorApp.redColor,
              ),
            ],
          ),
        );

      case ItemListType.employment:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // GetBuilder<HomeViwController>(id: id_order.toString(),
            //     builder: (logic) {
            //       return logic.isGetOrderDetails ? Center(
            //         child: CircularProgressIndicator(),) : CustomButton(
            //         width: size.width * .25,
            //         title: "تفاصيل الطلب",
            //         titleColor: ColorApp.redColor,
            //         onClick: () {
            //           logic.getGetOrderDetails(itemListType: item,
            //               id_order: id_order,
            //               size: size,
            //               context: context,
            //               updateId: id_order.toString());
            //         },
            //         fontWeight: FontWeight.bold,
            //         buttonColor: Colors.transparent,
            //       );
            //     }),
        // GetBuilder<HomeViwController>(id: id_order.toString(),
        //     builder: (logic) {
        //       return logic.isChangeStatusOrder ? Center(
        //         child: CircularProgressIndicator(),) :
        //             CustomButton(
        //             width: size.width * .25,
        //             title: "تسلبم الطلب",
        //             onClick: () {
        //
        //
        //             },
        //             fontWeight: FontWeight.bold,
        //             buttonColor: ColorApp.greenColor,
        //           );
        //         }),


            GetBuilder<HomeViwController>(
                id: getOrderDetailsModel!.result!
                    .orderDetails![0].idOrder!. toString(), builder: (logic) {
              return logic.isChangeStatusOrder ? Center(
                child: CircularProgressIndicator(),) :CustomButton(
                width: size.width * .25,
                title: "تسلبم الطلب",
                onClick: () {

                  logic.getChangeStatusOrder(
                      updateId: getOrderDetailsModel!.result!
                          .orderDetails![0].idOrder! .toString(),
                      id_order: getOrderDetailsModel!.result!
                          .orderDetails![0].idOrder , action: 2);
                },
                fontWeight: FontWeight.bold,
                buttonColor: ColorApp.greenColor,
              );
            }),
          ],
        );
      case ItemListType.finished:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<HomeViwController>(id: id_order.toString(),
                builder: (logic) {
                  return logic.isGetOrderDetails ? Center(
                    child: CircularProgressIndicator(),) : CustomButton(
                    width: size.width * .25,
                    title: "تم التوصيل",

                    onClick: () {
                      logic.getChangeStatusOrder(
                          updateId: getOrderDetailsModel!.result!
                              .orderDetails![0].idOrder! .toString(),
                          id_order: getOrderDetailsModel!.result!
                              .orderDetails![0].idOrder , action: 3);
                    },
                    fontWeight: FontWeight.bold,
                    buttonColor: ColorApp.greenColor,
                  );
                }),
          ],
        );



      case ItemListType.allfinished:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          ],
        );



    }
  }


  customBottomSheet2({
    required Size size,
  }) {
    Get.bottomSheet(Container(
      height: size.height * .8,
      width: size.width,
      color: Colors.redAccent,
    ));
  }


}

class PageToView extends StatelessWidget {
  late GlobalKey<NavigatorState> naigatorKey;
  late String tabItem;

  PageToView({required this.naigatorKey, required this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Container();

    switch (tabItem) {
      case 'Page1':
        {
          currentScreen = HomeTap1();

          break;
        }
      case 'Page2':
        {
          currentScreen = HomeTap2();

          break;
        }
      case 'Page3':
        {
          currentScreen = HomeTap3();
          break;
        }
      case 'Page4':
        {
          currentScreen = HomeTap4();
          break;
        }
    }

    return Navigator(
      key: naigatorKey,
      onGenerateRoute: (routeStings) {
        return MaterialPageRoute(builder: (context) => currentScreen);
      },
    );
  }
}
//
// Widget build(BuildContext context) {
//   Size size = MediaQuery.of(context).size;
//   return WillPopScope(
//       onWillPop: () async {
//         final isFirstRouteInCurrentTab = !await controller
//             .navigatorKeys[controller.currentPage].currentState
//             .maybePop();
//         //   print(isFirstRouteInCurrentTab);
//         if (isFirstRouteInCurrentTab) {
//           if (controller.currentPage != "Page1") {
//             controller.changeSelectedValue(0);
//
//             return false;
//           }
//         }
//         print(isFirstRouteInCurrentTab);
//         // let system handle back button if we're on the first route
//         return isFirstRouteInCurrentTab;
//       },
//       child: SafeArea(
//           child: Scaffold(
//           body: GetBuilder<HomeViwController>(builder: (logic) {
//   return logic.currentScreen;
//   }),
