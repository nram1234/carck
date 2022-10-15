import 'package:carck/netWork/abstract_json_resource.dart';

class ChangeStatusOrderModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;

  ChangeStatusOrderModel({this.message, this.codenum, this.status});

  ChangeStatusOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    codenum = json['codenum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['codenum'] = this.codenum;
    data['status'] = this.status;
    return data;
  }
}
