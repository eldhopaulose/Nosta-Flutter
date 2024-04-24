class RegisterVerifyRes {
  String? error;
  User? user;
  String? token;

  RegisterVerifyRes({this.error, this.user, this.token});

  RegisterVerifyRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  bool? isVerified;
  bool? isLogedIn;
  String? regOTP;
  String? regOTPExpiration;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.isVerified,
      this.isLogedIn,
      this.regOTP,
      this.regOTPExpiration,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLogedIn = json['isLogedIn'];
    regOTP = json['regOTP'];
    regOTPExpiration = json['regOTPExpiration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    data['isLogedIn'] = this.isLogedIn;
    data['regOTP'] = this.regOTP;
    data['regOTPExpiration'] = this.regOTPExpiration;
    data['__v'] = this.iV;
    return data;
  }
}
