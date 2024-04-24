class UpdateCartReq {
  int? quantity;

  UpdateCartReq({this.quantity});

  UpdateCartReq.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    return data;
  }
}
