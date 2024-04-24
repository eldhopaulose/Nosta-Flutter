class RegisterReq {
  String? error;
  String? name;
  String? email;

  RegisterReq({this.error, this.name, this.email});

  RegisterReq.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
