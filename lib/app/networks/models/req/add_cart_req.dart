class AddCartReq {
  String? error;
  int? quantity;

  AddCartReq({this.error, this.quantity});

  AddCartReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['quantity'] = this.quantity;
    return data;
  }
}
