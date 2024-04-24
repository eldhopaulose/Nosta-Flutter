class UnlikeRes {
  String? error;
  bool? success;
  Like? like;

  UnlikeRes({this.error, this.success, this.like});

  UnlikeRes.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? userId;
  String? productId;
  int? iV;

  Like({this.sId, this.userId, this.productId, this.iV});

  Like.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    productId = json['productId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['__v'] = this.iV;
    return data;
  }
}
