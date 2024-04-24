import 'package:e_commerse/app/networks/dio/dio_client.dart';

enum Endpoints {
  register,
  registerVerify,
  RegisterResend,
  signIn,
  signInVerify,
  signInResend,
  getUserData,
  getProductsData,
  getSingleProductById,
  addLike,
  unLike,
  getAllLiked,
  getAllLikes,
  addCart,
  getAllCart,
  updateDecrimentCart,
  deleteSingleCart,
  createAddress,
  getAddress,
  updateAddress,
  deleteAddress,
  orderPlaced,
}

extension EndpontData on Endpoints {
  String path() {
    String path = "";
    switch (this) {
      case Endpoints.register:
        path = "user/register";
      case Endpoints.registerVerify:
        path = "user/register/verify";
      case Endpoints.RegisterResend:
        path = "user/register/resend";
      case Endpoints.signIn:
        path = "user/signin";
      case Endpoints.signInVerify:
        path = "user/signin/verify";
      case Endpoints.signInResend:
        path = "user/signin/resend";
      case Endpoints.getUserData:
        path = "user/details";
      case Endpoints.getProductsData:
        path = "product/product";
      case Endpoints.getSingleProductById:
        path = "product/product/get";
      case Endpoints.addLike:
        path = "like/like";
      case Endpoints.unLike:
        path = "like/unlike";
      case Endpoints.getAllLiked:
        path = "like/likes";
      case Endpoints.getAllLikes:
        path = "like/likes-full-details";
      case Endpoints.addCart:
        path = "cart/add";
      case Endpoints.getAllCart:
        path = "cart";
      case Endpoints.updateDecrimentCart:
        path = "cart/decriment";
      case Endpoints.deleteSingleCart:
        path = "cart/remove";
      case Endpoints.createAddress:
        path = "adress";
      case Endpoints.getAddress:
        path = "adress";
      case Endpoints.updateAddress:
        path = "adress";
      case Endpoints.deleteAddress:
        path = "adress";
      case Endpoints.orderPlaced:
       path = "order";
    }
    return path;
  }

  ReqType type() {
    ReqType type;
    switch (this) {
      case Endpoints.register:
        type = ReqType.POST;
      case Endpoints.registerVerify:
        type = ReqType.POST;
      case Endpoints.RegisterResend:
        type = ReqType.POST;
      case Endpoints.signIn:
        type = ReqType.POST;
      case Endpoints.signInVerify:
        type = ReqType.POST;
      case Endpoints.signInResend:
        type = ReqType.POST;
      case Endpoints.getUserData:
        type = ReqType.GET;
      case Endpoints.getProductsData:
        type = ReqType.GET;
      case Endpoints.getSingleProductById:
        type = ReqType.GET;
      case Endpoints.addLike:
        type = ReqType.POST;
      case Endpoints.unLike:
        type = ReqType.POST;
      case Endpoints.getAllLiked:
        type = ReqType.GET;
      case Endpoints.getAllLikes:
        type = ReqType.GET;
      case Endpoints.addCart:
        type = ReqType.POST;
      case Endpoints.getAllCart:
        type = ReqType.GET;
      case Endpoints.updateDecrimentCart:
        type = ReqType.POST;
      case Endpoints.deleteSingleCart:
        type = ReqType.DELETE;
      case Endpoints.createAddress:
        type = ReqType.POST;
      case Endpoints.getAddress:
        type = ReqType.GET;
      case Endpoints.updateAddress:
        type = ReqType.PUT;
      case Endpoints.deleteAddress:
        type = ReqType.DELETE;
      case Endpoints.orderPlaced:
        type = ReqType.POST;
    }
    return type;
  }

  bool hasToken() {
    bool hasToken = false;
    switch (this) {
      case Endpoints.register:
        hasToken = false;
      case Endpoints.registerVerify:
        hasToken = false;
      case Endpoints.RegisterResend:
        hasToken = false;
      case Endpoints.signIn:
        hasToken = false;
      case Endpoints.signInVerify:
        hasToken = false;
      case Endpoints.signInResend:
        hasToken = false;
      case Endpoints.getUserData:
        hasToken = true;
      case Endpoints.getProductsData:
        hasToken = false;
      case Endpoints.getSingleProductById:
        hasToken = false;
      case Endpoints.addLike:
        hasToken = true;
      case Endpoints.unLike:
        hasToken = true;
      case Endpoints.getAllLiked:
        hasToken = true;
      case Endpoints.getAllLikes:
        hasToken = true;
      case Endpoints.addCart:
        hasToken = true;
      case Endpoints.getAllCart:
        hasToken = true;
      case Endpoints.updateDecrimentCart:
        hasToken = true;
      case Endpoints.deleteSingleCart:
        hasToken = true;
      case Endpoints.createAddress:
        hasToken = true;
      case Endpoints.getAddress:
        hasToken = true;
      case Endpoints.updateAddress:
        hasToken = true;
      case Endpoints.deleteAddress:
        hasToken = true;
      case Endpoints.orderPlaced:
        hasToken = true;
    }
    return hasToken;
  }
}
