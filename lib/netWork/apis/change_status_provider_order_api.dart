
import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../models/change_status_order_model.dart';


class ChangeStatusProviderOrderAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.changeStatusProviderOrderUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return ChangeStatusOrderModel.fromJson(data);
  }
  
}