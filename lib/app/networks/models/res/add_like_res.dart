class AddLikeRes {
  String? error;
  bool? success;
  Like? like;

  AddLikeRes({this.error, this.success, this.like});

  AddLikeRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    like = json['like'] != null ? new Like.fromJson(json['like']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.like != null) {
      data['like'] = this.like!.toJson();
    }
    return data;
  }
}

class Like {
  String? userId;
  String? productId;
  String? sId;
  int? iV;

  Like({this.userId, this.productId, this.sId, this.iV});

  Like.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productId = json['productId'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
