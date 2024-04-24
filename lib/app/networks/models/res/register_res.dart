class RegisterRes {
  String? error;
  String? email;
  User? user;

  RegisterRes({this.error, this.email, this.user});

  RegisterRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  bool? isVerified;
  bool? isLogedIn;
  String? regOTP;
  String? regOTPExpiration;
  String? sId;
  int? iV;

  User(
      {this.name,
      this.email,
      this.isVerified,
      this.isLogedIn,
      this.regOTP,
      this.regOTPExpiration,
      this.sId,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLogedIn = json['isLogedIn'];
    regOTP = json['regOTP'];
    regOTPExpiration = json['regOTPExpiration'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    data['isLogedIn'] = this.isLogedIn;
    data['regOTP'] = this.regOTP;
    data['regOTPExpiration'] = this.regOTPExpiration;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
