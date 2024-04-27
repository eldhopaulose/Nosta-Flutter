class GetSingleProductByIdRes {
  String? error;
  Product? product;

  GetSingleProductByIdRes({this.error, this.product});

  GetSingleProductByIdRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? price;
  String? originalPrice;
  String? discount;
  String? thumbnail;
  List<String>? images;
  String? description;
  List<String>? category;
  String? shippingCost;
  int? iV;

  Product(
      {this.sId,
      this.name,
      this.price,
      this.originalPrice,
      this.discount,
      this.thumbnail,
      this.images,
      this.description,
      this.category,
      this.shippingCost,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    originalPrice = json['originalPrice'];
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
    data['originalPrice'] = this.originalPrice;
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
