import 'package:carck/netWork/abstract_json_resource.dart';

class GetOrderDetailsModel extends AbstractJsonResource{
  bool? message;
  int? codenum;
  bool? status;
  Result? result;

  GetOrderDetailsModel({this.message, this.codenum, this.status, this.result});

  GetOrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? fullname;
  String? phone;
  String? address;
  String? cityName;
  String? shippingCharges;
  String? currencyName;
  String? date;
  bool? viewStore;
  int? viewId;

  OrderDetails(
      {this.codeName,
        this.idOrder,
        this.totalPrice,
        this.totalProduct,
        this.fullname,
        this.phone,
        this.address,
        this.cityName,
        this.shippingCharges,
        this.currencyName,
        this.date,
        this.viewStore,
        this.viewId});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    codeName = json['code_name'];
    idOrder = json['id_order'];
    totalPrice = json['total_price'];
    totalProduct = json['total_product'];
    fullname = json['fullname'];
    phone = json['phone'];
    address = json['address'];
    cityName = json['city_name'];
    shippingCharges = json['shipping_charges'];
    currencyName = json['currency_name'];
    date = json['date'];
    viewStore = json['view_store'];
    viewId = json['view_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code_name'] = this.codeName;
    data['id_order'] = this.idOrder;
    data['total_price'] = this.totalPrice;
    data['total_product'] = this.totalProduct;
    data['fullname'] = this.fullname;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city_name'] = this.cityName;
    data['shipping_charges'] = this.shippingCharges;
    data['currency_name'] = this.currencyName;
    data['date'] = this.date;
    data['view_store'] = this.viewStore;
    data['view_id'] = this.viewId;
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
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['currency_name'] = this.currencyName;
    data['image'] = this.image;
    return data;
  }
}
