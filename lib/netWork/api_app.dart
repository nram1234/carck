class APIApp {


  static const String baseUrl = 'https://karakcloud.com/';


  static const String loginUrl =baseUrl+"delivery/login";

  static const String homeUrl =baseUrl+"delivery/home";
  static const String getOrderDetailsUrl =baseUrl+"delivery/get_order_details";
  static const String getDataInfoUrl =baseUrl+"delivery/get_data_info";
  static const String getPreparationProfileUrl =baseUrl+"delivery/preparation_profile";
  static const String geteditProfileUrl =baseUrl+"delivery/edit_profile";
  static const String getWaitingOrdersUrl =baseUrl+"delivery/get_waiting_orders";
  static const String getCurrentOrdersUrl =baseUrl+"delivery/get_current_orders";
  static const String getReceivedOrdersUrl =baseUrl+"delivery/get_received_orders";
  static const String changeStatuOrderUrl =baseUrl+"delivery/change_status_order";
  static const String getDeliveredOrdersUrl =baseUrl+"delivery/get_delivered_orders";


  static const String getListNotificationsUrl =baseUrl+"delivery/get_list_notifications";
  static const String   getOrderUserDetailsUrl =baseUrl+"delivery/get_order_user_details";

  static const String   getSetLocationUrl =baseUrl+"delivery/set_location";


  static const String   changeStatusProviderOrderUrl =baseUrl+"delivery/change_status_provider_order";


}
