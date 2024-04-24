class AddCartRes {
  String? error;
  bool? success;
  Cart? cart;

  AddCartRes({this.error, this.success, this.cart});

  AddCartRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    return data;
  }
}

class Cart {
  String? userId;
  List<Items>? items;
  String? sId;
  int? iV;

  Cart({this.userId, this.items, this.sId, this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  String? productId;
  int? quantity;
  String? sId;

  Items({this.productId, this.quantity, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}
