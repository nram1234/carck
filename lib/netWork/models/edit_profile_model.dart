import 'package:carck/netWork/abstract_json_resource.dart';

class EditProfileModel extends AbstractJsonResource{
  bool? message;
  int? codenum;
  bool? status;
  Result? result;

  EditProfileModel({this.message, this.codenum, this.status, this.result});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  CustomerInfo? customerInfo;

  Result({this.customerInfo});

  Result.fromJson(Map<String, dynamic> json) {
    customerInfo = json['customer_info'] != null
        ? new CustomerInfo.fromJson(json['customer_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerInfo != null) {
      data['customer_info'] = this.customerInfo!.toJson();
    }
    return data;
  }
}

class CustomerInfo {
  int? agentId;
  String? name;
  String? phone;
  String? address;
  String? email;

  CustomerInfo({this.agentId, this.name, this.phone, this.address, this.email});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    agentId = json['agent_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent_id'] = this.agentId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}
