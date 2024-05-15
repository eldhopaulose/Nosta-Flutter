class OfferRes {
  String? error;
  List<Offers>? offers;

  OfferRes({this.error, this.offers});

  OfferRes.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? sId;
  List<String>? image;
  int? iV;

  Offers({this.sId, this.image, this.iV});

  Offers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
