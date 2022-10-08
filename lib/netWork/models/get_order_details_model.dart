import 'package:carck/netWork/abstract_json_resource.dart';

class GetOrderDetailsModel extends AbstractJsonResource{
  String? message;
  int? codenum;
  bool? status;
  Result? result;

  GetOrderDetailsModel({this.message, this.codenum, this.status, this.result});

  GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
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
  List<OrderDetails>? orderDetails;
  List<AllProducts>? allProducts;

  Result({this.orderDetails, this.allProducts});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    if (json['all_products'] != null) {
      allProducts = <AllProducts>[];
      json['all_products'].forEach((v) {
        allProducts!.add(new AllProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    if (this.allProducts != null) {
      data['all_products'] = this.allProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? codeName;
  int? idOrder;
  String? totalPrice;
  String? totalProduct;
  String? shippingCharges;
  String? currencyName;
  String? date;

  OrderDetails(
      {this.codeName,
        this.idOrder,
        this.totalPrice,
        this.totalProduct,
        this.shippingCharges,
        this.currencyName,
        this.date});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    codeName = json['code_name'];
    idOrder = json['id_order'];
    totalPrice = json['total_price'];
    totalProduct = json['total_product'];
    shippingCharges = json['shipping_charges'];
    currencyName = json['currency_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code_name'] = this.codeName;
    data['id_order'] = this.idOrder;
    data['total_price'] = this.totalPrice;
    data['total_product'] = this.totalProduct;
    data['shipping_charges'] = this.shippingCharges;
    data['currency_name'] = this.currencyName;
    data['date'] = this.date;
    return data;
  }
}

class AllProducts {
  int? id;
  int? idProduct;
  String? providerName;
  String? providerPhone;
  String? providerAddress;
  String? providerCity;
  String? productStatus;
  String? productName;
  String? color;
  String? size;
  String? price;
  String? quantity;
  String? currencyName;
  String? image;

  AllProducts(
      {this.id,
        this.idProduct,
        this.providerName,
        this.providerPhone,
        this.providerAddress,
        this.providerCity,
        this.productStatus,
        this.productName,
        this.color,
        this.size,
        this.price,
        this.quantity,
        this.currencyName,
        this.image});

  AllProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduct = json['id_product'];
    providerName = json['provider_name'];
    providerPhone = json['provider_phone'];
    providerAddress = json['provider_address'];
    providerCity = json['provider_city'];
    productStatus = json['product_status'];
    productName = json['product_name'];
    color = json['color'];
    size = json['size'];
    price = json['price'];
    quantity = json['quantity'];
    currencyName = json['currency_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_product'] = this.idProduct;
    data['provider_name'] = this.providerName;
    data['provider_phone'] = this.providerPhone;
    data['provider_address'] = this.providerAddress;
    data['provider_city'] = this.providerCity;
    data['product_status'] = this.productStatus;
    data['product_name'] = this.productName;
    data['color'] = this.color;
    data['size'] = this.size;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['currency_name'] = this.currencyName;
    data['image'] = this.image;
    return data;
  }
}
