import 'package:carck/netWork/abstract_json_resource.dart';

class GetWaitingOrdersModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  GetWaitingOrdersModel({this.message, this.codenum, this.status, this.result});

  GetWaitingOrdersModel.fromJson(Map<String, dynamic> json) {
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
  String? currenyName;
  List<DetailsOrder>? detailsOrder;

  Result({this.currenyName, this.detailsOrder});

  Result.fromJson(Map<String, dynamic> json) {
    currenyName = json['curreny_name'];
    if (json['details_orders'] != null) {
      detailsOrder = <DetailsOrder>[];
      json['details_orders'].forEach((v) {
        detailsOrder!.add(new DetailsOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curreny_name'] = this.currenyName;
    if (this.detailsOrder != null) {
      data['details_orders'] =
          this.detailsOrder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailsOrder {
  int? codeName;
  int? idOrder;
  String? totalPrice;
  String? totalProduct;
  String? date;
  String? sharevalue;

  DetailsOrder(
      {this.codeName,
        this.idOrder,
        this.totalPrice,
        this.totalProduct,
        this.date,this.sharevalue});

  DetailsOrder.fromJson(Map<String, dynamic> json) {
    codeName = json['code_name'];
    idOrder = json['id_order'];
    totalPrice = json['total_price'];
    totalProduct = json['total_product'];
    date = json['date'];
    sharevalue = json['share_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code_name'] = this.codeName;
    data['id_order'] = this.idOrder;
    data['total_price'] = this.totalPrice;
    data['total_product'] = this.totalProduct;

    data['date'] = this.date;
    return data;
  }
}
