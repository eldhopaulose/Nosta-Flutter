class SigninResendReq {
  String? error;
  String? email;

  SigninResendReq({this.error, this.email});

  SigninResendReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['email'] = this.email;
    return data;
  }
}
