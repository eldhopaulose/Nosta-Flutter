class SigninRes {
  String? error;
  String? user;

  SigninRes({this.error, this.user});

  SigninRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['user'] = this.user;
    return data;
  }
}
