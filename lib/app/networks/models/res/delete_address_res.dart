class DeleteAddressRes {
  String? error;
  bool? success;
  Address? address;

  DeleteAddressRes({this.error, this.success, this.address});

  DeleteAddressRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? sId;
  String? userId;
  String? name;
  String? address;
  String? mobileNumber;
  String? pincode;
  String? district;
  String? state;
  int? iV;

  Address(
      {this.sId,
      this.userId,
      this.name,
      this.address,
      this.mobileNumber,
      this.pincode,
      this.district,
      this.state,
      this.iV});

  Address.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    address = json['address'];
    mobileNumber = json['mobileNumber'];
    pincode = json['pincode'];
    district = json['district'];
    state = json['state'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobileNumber'] = this.mobileNumber;
    data['pincode'] = this.pincode;
    data['district'] = this.district;
    data['state'] = this.state;
    data['__v'] = this.iV;
    return data;
  }
}
