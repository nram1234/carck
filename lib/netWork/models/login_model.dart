import 'package:carck/netWork/abstract_json_resource.dart';

class LogInModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  LogInModel({this.message, this.codenum, this.status, this.result});

  LogInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
    codenum = json['codenum'];
    status = json['status'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
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
  List<AgentData>? agentData;

  Result({this.agentData});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['agent_data'] != null) {
      agentData = <AgentData>[];
      json['agent_data'].forEach((v) {
        agentData!.add(new AgentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agentData != null) {
      data['agent_data'] = this.agentData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgentData {
  String? name;
  String? phone;
  int? id;
  String? mail;

  AgentData({this.name, this.phone, this.id, this.mail});

  AgentData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    mail = json['mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['id'] = this.id;
    data['mail'] = this.mail;
    return data;
  }
}
