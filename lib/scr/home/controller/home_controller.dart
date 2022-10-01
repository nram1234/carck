import 'package:carck/scr/home/home_tap1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),



          Card(elevation: 8,child: Cu,)

            ]),
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
