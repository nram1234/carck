
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_order_details_model.dart';
import '../models/get_order_user_details_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class GetOrderUserDetailsAPI extends ApiManager{
  @override
  String apiUrl() {
    return APIApp.getOrderUserDetailsUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return GetOrderUserDetailsModel.fromJson(data);
  }

}