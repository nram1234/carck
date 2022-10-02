import 'package:carck/scr/home/home_tap1.dart';
import 'package:carck/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sheardWidgets/custom_button.dart';
import '../home_tap2.dart';
import '../home_tap3.dart';
import '../home_tap4.dart';

class HomeViwController extends GetxController {
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
  }

  changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    _currentPage = _pageKeys[selectedValue];
    _navigatorKey = _navigatorKeys[_currentPage];

    currentScreen = PageToView(
      naigatorKey: _navigatorKey,
      tabItem: _currentPage,
    );

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

  List<String> list = ["طلبات منتظره", "طلبات حالية", "طلبات سابقه"];
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

  customBottomSheet({required Size size, required context}) {
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
                                "No.#1893",
                                style: TextStyle(
                                    fontSize: 24, color: ColorApp.blueColor),
                              ),
                              Text(
                                "Apr 11, 2021 2:00PM",
                                style: TextStyle(fontSize: 12),
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
                                      flex: 3,
                                      child: Text(
                                        "محمد أحمد",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": الاسم",
                                        style: TextStyle(fontSize: 15),
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
                                        "966123456789",
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": الجوال",
                                        style: TextStyle(fontSize: 15),
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
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.right,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        ": العنوان",
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

                  ...List<Widget>.generate(
                      5,
                      (i) => SizedBox(
                            width: size.width * .9,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://5.imimg.com/data5/CM/AV/LJ/SELLER-68434442/designer-bedroom-furniture-1000x1000.jpg",
                                    width: 50,
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text("okokjokookokkokkoko")),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(child: Text("$i  \$")))
                                ],
                              ),
                            ),
                          )),

                  SizedBox(
                    width: size.width * .9,
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("السعر"),
                              Spacer(),
                              Text(
                                "500987767  \$",
                                style: TextStyle(color: ColorApp.primaryColor),
                              )
                            ],
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("خدمة التوصيل"),
                              Spacer(),
                              Text(
                                "500987767  \$",
                                style: TextStyle(color: ColorApp.primaryColor),
                              )
                            ],
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("قسيمة الخصم"),
                              Spacer(),
                              Text(
                                "500987767  \$",
                                style: TextStyle(color: ColorApp.primaryColor),
                              )
                            ],
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text("الاجمالي"),
                              Spacer(),
                              Text(
                                "500987767  \$",
                                style: TextStyle(color: ColorApp.primaryColor),
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
                  Text(
                    "الاجمالي",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: size.width * .8,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Text("حاله الطلب"),
                          Spacer(),
                          Text(
                            "قيد الانتظار",
                            style: TextStyle(
                                color: ColorApp.primaryColor,
                                fontWeight: FontWeight.bold,fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
          Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          CustomButton(
          width: size.width * .25,
          title: "قبول الطلب",
          onClick: () {},
          fontWeight: FontWeight.bold,
          buttonColor: ColorApp.greenColor,
          ),
          CustomButton(
          width: size.width * .25,
          title: "رفض الطلب",
          onClick: () {},
          fontWeight: FontWeight.bold,
          buttonColor: ColorApp.redColor,
          ),
          ],
          ),
          ),SizedBox(height: 50,)  ]),
              ),
            ),
          );
        });
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
