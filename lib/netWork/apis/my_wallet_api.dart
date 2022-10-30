
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/get_data_info_model.dart';
import '../models/home_model.dart';
import '../models/login_model.dart';
import '../models/my_wallet_model.dart';

class MyWalletAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.myWalletUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return MyWalletModel.fromJson(data);
  }
  
}