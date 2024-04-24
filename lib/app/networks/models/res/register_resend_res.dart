class RegisterResendRes {
  String? error;
  String? message;
  String? user;

  RegisterResendRes({this.error, this.message, this.user});

  RegisterResendRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['user'] = this.user;
    return data;
  }
}
