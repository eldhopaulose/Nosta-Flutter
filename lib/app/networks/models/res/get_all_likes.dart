class GetAllLikesRes {
  String? error;
  bool? success;
  List<Likes>? likes;

  GetAllLikesRes({this.error, this.success, this.likes});

  GetAllLikesRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  String? sId;
  String? userId;
  ProductId? productId;
  int? iV;

  Likes({this.sId, this.userId, this.productId, this.iV});

  Likes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productId = json['productId'] != null
        ? new ProductId.fromJson(json['productId'])
        : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.productId != null) {
      data['productId'] = this.productId!.toJson();
    }
    data['__v'] = this.iV;
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
  String? originalPrice;

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
      this.iV,
      this.originalPrice});

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
    originalPrice = json['originalPrice'];
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
    data['originalPrice'] = this.originalPrice;
    return data;
  }
}
