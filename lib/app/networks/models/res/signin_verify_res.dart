class SigninVerifyRes {
  String? error;
  String? message;
  String? token;
  User? user;

  SigninVerifyRes({this.error, this.message, this.token, this.user});

  SigninVerifyRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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
  String? sigOTP;
  String? sigOTPExpiration;

  User(
      {this.sId,
      this.name,
      this.email,
      this.isVerified,
      this.isLogedIn,
      this.regOTP,
      this.regOTPExpiration,
      this.iV,
      this.sigOTP,
      this.sigOTPExpiration});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLogedIn = json['isLogedIn'];
    regOTP = json['regOTP'];
    regOTPExpiration = json['regOTPExpiration'];
    iV = json['__v'];
    sigOTP = json['sigOTP'];
    sigOTPExpiration = json['sigOTPExpiration'];
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
    data['sigOTP'] = this.sigOTP;
    data['sigOTPExpiration'] = this.sigOTPExpiration;
    return data;
  }
}
