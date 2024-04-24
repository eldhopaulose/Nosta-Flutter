class OrderPlacedReq {
  List? productId;
  int? totalCost;
  String? address;

  OrderPlacedReq({this.productId, this.totalCost, this.address});

  OrderPlacedReq.fromJson(Map<String, dynamic> json) {
    productId = json['productId'].cast<String>();
    totalCost = json['totalCost'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['totalCost'] = this.totalCost;
    data['address'] = this.address;
    return data;
  }
}
