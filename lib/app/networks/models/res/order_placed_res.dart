class OrderPlacedRes {
  String? error;
  List<Items>? items;
  String? sId;
  int? orderId;
  int? iV;

  OrderPlacedRes({this.error, this.items, this.sId, this.orderId, this.iV});

  OrderPlacedRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    sId = json['_id'];
    orderId = json['orderId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['orderId'] = this.orderId;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  String? userId;
  List<String>? productId;
  int? totalCost;
  String? address;
  String? status;
  String? sId;
  String? billDate;
  String? deliveryDate;

  Items(
      {this.userId,
      this.productId,
      this.totalCost,
      this.address,
      this.status,
      this.sId,
      this.billDate,
      this.deliveryDate});

  Items.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productId = json['productId'].cast<String>();
    totalCost = json['totalCost'];
    address = json['address'];
    status = json['status'];
    sId = json['_id'];
    billDate = json['billDate'];
    deliveryDate = json['deliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['totalCost'] = this.totalCost;
    data['address'] = this.address;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['billDate'] = this.billDate;
    data['deliveryDate'] = this.deliveryDate;
    return data;
  }
}
