import 'package:carck/netWork/abstract_json_resource.dart';

class PreparationProfileModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  PreparationProfileModel(
      {this.message, this.codenum, this.status, this.result});

  PreparationProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? phone;
  String? address;
  String? email;
  String? img;

  CustomerInfo(
      {this.id, this.name, this.phone, this.address, this.email, this.img});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['img'] = this.img;
    return data;
  }
}
