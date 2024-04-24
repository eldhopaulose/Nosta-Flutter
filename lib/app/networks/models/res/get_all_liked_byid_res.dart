class GetAllLikesByIdRes {
  String? error;
  bool? success;
  List<Likes>? likes;

  GetAllLikesByIdRes({this.error, this.success, this.likes});

  GetAllLikesByIdRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    success = json['success'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success'] = this.success;
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Likes {
  String? sId;
  String? userId;
  String? productId;
  int? iV;

  Likes({this.sId, this.userId, this.productId, this.iV});

  Likes.fromJson(Map<String, dynamic> json) {
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
