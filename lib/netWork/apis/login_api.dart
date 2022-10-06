
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/login_model.dart';

class LogInAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.loginUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return LogInModel.fromJson(data);
  }
  
}