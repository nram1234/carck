
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/edit_profile_model.dart';
import '../models/get_data_info_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';

class EditProfileAPI extends ApiManager{
  @override
  String apiUrl() {
    return APIApp.geteditProfileUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return EditProfileModel.fromJson(data);
  }

}