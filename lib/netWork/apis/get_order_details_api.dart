
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_order_details_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class GetOrderDetailsAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.getOrderDetailsUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return GetOrderDetailsModel.fromJson(data);
  }
  
}