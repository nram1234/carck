import 'package:carck/netWork/abstract_json_resource.dart';

class HomeModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  HomeModel({this.message, this.codenum, this.status, this.result});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  int? totalOrders;
  int? totalCommission;
  String? commissionRate;
  List<DetailsOrders>? detailsOrders;

  Result(
      {this.currenyName,
        this.totalOrders,
        this.totalCommission,
        this.commissionRate,
        this.detailsOrders});

  Result.fromJson(Map<String, dynamic> json) {
    currenyName = json['curreny_name'];
    totalOrders = json['total_orders'];
    totalCommission = json['total_commission'];
    commissionRate = json['commission_rate'];
    if (json['details_orders'] != null) {
      detailsOrders = <DetailsOrders>[];
      json['details_orders'].forEach((v) {
        detailsOrders!.add(new DetailsOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curreny_name'] = this.currenyName;
    data['total_orders'] = this.totalOrders;
    data['total_commission'] = this.totalCommission;
    data['commission_rate'] = this.commissionRate;
    if (this.detailsOrders != null) {
      data['details_orders'] =
          this.detailsOrders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailsOrders {
  int? codeName;
  int? idOrder;
  String? totalPrice;
  String? totalProduct;
  String? date;
  String? sharevalue;
  DetailsOrders(
      {this.codeName,
        this.idOrder,
        this.totalPrice,
        this.totalProduct,
        this.date,this.sharevalue});

  DetailsOrders.fromJson(Map<String, dynamic> json) {
    codeName = json['code_name'];
    idOrder = json['id_order'];
    totalPrice = json['total_price'];
    totalProduct = json['total_product'];
    sharevalue = json['share_value'];

    date = json['date'];
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
