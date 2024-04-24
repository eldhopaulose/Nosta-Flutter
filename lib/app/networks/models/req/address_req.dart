class AddressReq {
  String? error;
  String? name;
  String? address;
  String? pincode;
  String? mobileNumber;
  String? district;
  String? state;

  AddressReq(
      {this.error,
      this.name,
      this.address,
      this.pincode,
      this.mobileNumber,
      this.district,
      this.state});

  AddressReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    address = json['address'];
    pincode = json['pincode'];
    mobileNumber = json['mobileNumber'];
    district = json['district'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['mobileNumber'] = this.mobileNumber;
    data['district'] = this.district;
    data['state'] = this.state;
    return data;
  }
}
