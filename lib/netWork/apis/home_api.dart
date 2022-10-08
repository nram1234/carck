
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class HomeAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.homeUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return HomeModel.fromJson(data);
  }
  
}