import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../netWork/apis/get_list_notifications_api.dart';
import '../../netWork/models/get_list_notifications_model.dart';
import '../../utility/all_string_const.dart';
import '../../utility/storage.dart';


class NotificationController extends GetxController{


  GetListNotificationsModel? allNotificationsModel;


  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool loading;
  final int _numberOfPostsPerRequest = 20;
  late List<AllNotifications> allNotifications=[];
 // final int _nextPageTrigger = ;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    loading = true;
  }


  @override
  void onReady() {
    super.onReady();
    _pageNumber = 0;
    allNotifications = [];
    _isLastPage = false;

    _error = false;
    getAllAotifications();
    addItems();
  }
  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        if(_isLastPage){
          getAllAotifications();
        }

      }
    });
  }


  Future<void> onRefresh() async {
    _pageNumber = 0;
    allNotifications.clear();
    getAllAotifications();



  }
  getAllAotifications(){
    loading = true;
        GetListNotificationsAPI allAotificationsAPI=GetListNotificationsAPI();
    //    allAotificationsAPI.data="token=${SecureStorage.readSecureData(AllStringConst.Token)}";



        Map<String, dynamic> a = {};
        a['agent_id'] = SecureStorage.readSecureDataINT(AllStringConst.id);

        a['key'] = '1234567890';
        a['page_number'] = _pageNumber;
        a['limit'] = _numberOfPostsPerRequest;
allAotificationsAPI.post(a).then((value) {
  allNotificationsModel=value as GetListNotificationsModel;
  _isLastPage = (allNotificationsModel?.result?.allNotifications?.length??0) < _numberOfPostsPerRequest;
  loading = false;
  _pageNumber = _pageNumber + 1;

  allNotifications.addAll(allNotificationsModel?.result?.allNotifications??[]);





  print("allNotificationsModelallNotificationsModel  ${allNotificationsModel?.toJson()}");
  update();
});



      }


  _scrollListener() {
   // if(scrollController.hasClients){
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent ) {

      //  if (_isLastPage) {
          getAllAotifications();
print("0000000000000000000000000000000000000000000000000000000000000");
       // }
      }
      // if (scrollController.offset <= scrollController.position.minScrollExtent &&
      //     !scrollController.position.outOfRange) {
      //   print("reach the top");
      // }
   // }

  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}