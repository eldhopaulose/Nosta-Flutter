class SigninVerifyReq {
  String? error;
  String? email;
  String? otp;

  SigninVerifyReq({this.error, this.email, this.otp});

  SigninVerifyReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    data['otp'] = this.otp;
    return data;
  }
}
