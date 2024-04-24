class GetAllCartRes {
  String? error;
  bool? success;
  List<Carts>? carts;

  GetAllCartRes({this.error, this.success, this.carts});

  GetAllCartRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  String? sId;
  UserId? userId;
  List<Items>? items;
  int? iV;

  Carts({this.sId, this.userId, this.items, this.iV});

  Carts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;
  bool? isVerified;
  bool? isLogedIn;
  String? regOTP;
  String? regOTPExpiration;
  int? iV;
  String? sigOTP;
  String? sigOTPExpiration;

  UserId(
      {this.sId,
      this.name,
      this.email,
      this.isVerified,
      this.isLogedIn,
      this.regOTP,
      this.regOTPExpiration,
      this.iV,
      this.sigOTP,
      this.sigOTPExpiration});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLogedIn = json['isLogedIn'];
    regOTP = json['regOTP'];
    regOTPExpiration = json['regOTPExpiration'];
    iV = json['__v'];
    sigOTP = json['sigOTP'];
    sigOTPExpiration = json['sigOTPExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    data['isLogedIn'] = this.isLogedIn;
    data['regOTP'] = this.regOTP;
    data['regOTPExpiration'] = this.regOTPExpiration;
    data['__v'] = this.iV;
    data['sigOTP'] = this.sigOTP;
    data['sigOTPExpiration'] = this.sigOTPExpiration;
    return data;
  }
}

class Items {
  ProductId? productId;
  double? totalCost; // Changed data type to double
  int? quantity;
  String? sId;

  Items({this.productId, this.totalCost, this.quantity, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['productId'] != null
        ? ProductId.fromJson(json['productId'])
        : null;
    // Convert totalCost to double
    totalCost = json['totalCost']?.toDouble(); // Convert to double
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productId != null) {
      data['productId'] = productId!.toJson();
    }
    data['totalCost'] = totalCost; // No need to convert again
    data['quantity'] = quantity;
    data['_id'] = sId;
    return data;
  }
}

class ProductId {
  String? sId;
  String? name;
  String? price;
  String? discount;
  String? thumbnail;
  List<String>? images;
  String? description;
  List<String>? category;
  String? shippingCost;
  int? iV;

  ProductId(
      {this.sId,
      this.name,
      this.price,
      this.discount,
      this.thumbnail,
      this.images,
      this.description,
      this.category,
      this.shippingCost,
      this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
    description = json['description'];
    category = json['category'].cast<String>();
    shippingCost = json['shippingCost'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    data['description'] = this.description;
    data['category'] = this.category;
    data['shippingCost'] = this.shippingCost;
    data['__v'] = this.iV;
    return data;
  }
}
