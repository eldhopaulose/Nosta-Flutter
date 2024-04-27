class GetProductRes {
  String? error;
  List<Products>? products;

  GetProductRes({this.error, this.products});

  GetProductRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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
