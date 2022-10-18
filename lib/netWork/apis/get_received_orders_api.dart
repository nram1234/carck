
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_data_info_model.dart';
import '../models/get_waiting_orders.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class GetgReceivedOrdersAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.getReceivedOrdersUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return GetWaitingOrdersModel.fromJson(data);
  }
  
}