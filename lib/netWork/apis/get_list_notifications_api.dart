
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_data_info_model.dart';
import '../models/get_list_notifications_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class GetListNotificationsAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.getListNotificationsUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return GetListNotificationsModel.fromJson(data);
  }
  
}