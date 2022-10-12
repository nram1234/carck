
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_data_info_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';
import '../models/preparation_profile_model.dart';

class GetPreparationProfileAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.getPreparationProfileUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return PreparationProfileModel.fromJson(data);
  }
  
}