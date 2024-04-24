class GetUserDataRes {
  String? error;
  User? user;

  GetUserDataRes({this.error, this.user});

  GetUserDataRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
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
  int? iV;
  String? sigOTPExpiration;

  User(
      {this.sId,
      this.name,
      this.email,
      this.isVerified,
      this.isLogedIn,
      this.iV,
      this.sigOTPExpiration});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    isLogedIn = json['isLogedIn'];
    iV = json['__v'];
    sigOTPExpiration = json['sigOTPExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    data['isLogedIn'] = this.isLogedIn;
    data['__v'] = this.iV;
    data['sigOTPExpiration'] = this.sigOTPExpiration;
    return data;
  }
}
