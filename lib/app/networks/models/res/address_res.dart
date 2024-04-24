class AddressRes {
  String? error;
  bool? success;
  NewAddress? newAddress;

  AddressRes({this.error, this.success, this.newAddress});

  AddressRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    newAddress = json['newAddress'] != null
        ? new NewAddress.fromJson(json['newAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.newAddress != null) {
      data['newAddress'] = this.newAddress!.toJson();
    }
    return data;
  }
}

class NewAddress {
  String? userId;
  String? name;
  String? address;
  String? mobileNumber;
  String? pincode;
  String? district;
  String? state;
  String? sId;
  int? iV;

  NewAddress(
      {this.userId,
      this.name,
      this.address,
      this.mobileNumber,
      this.pincode,
      this.district,
      this.state,
      this.sId,
      this.iV});

  NewAddress.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    address = json['address'];
    mobileNumber = json['mobileNumber'];
    pincode = json['pincode'];
    district = json['district'];
    state = json['state'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobileNumber'] = this.mobileNumber;
    data['pincode'] = this.pincode;
    data['district'] = this.district;
    data['state'] = this.state;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
