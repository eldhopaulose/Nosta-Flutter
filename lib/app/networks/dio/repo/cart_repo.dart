import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/add_cart_req.dart';
import 'package:e_commerse/app/networks/models/req/update_cart_req.dart';
import 'package:e_commerse/app/networks/models/res/add_cart_res.dart';
import 'package:e_commerse/app/networks/models/res/cart_delete.res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_cart_res.dart';
import 'package:e_commerse/app/networks/models/res/update_cart_res.dart';

class CartRepo {
  DioClient dioClient = DioClient(Dio());

  Future<AddCartRes?> addCart(String id, AddCartReq addCartReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.addCart,
        data: addCartReq.toJson(),
        queryParameters: id,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        } else if (response.statusCode == 400) {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        } else {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        }
      } else {
        return AddCartRes(error: "Something went wrong!");
      }
    } catch (e) {
      return AddCartRes(error: e.toString());
    }
  }

  Future<GetAllCartRes?> getAllCart() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getAllCart,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final getAllCartResponse = GetAllCartRes.fromJson(response.data);
          return getAllCartResponse;
        } else if (response.statusCode == 400) {
          final getAllCartResponse = GetAllCartRes.fromJson(response.data);
          return getAllCartResponse;
        } else {
          final getAllCartResponse = GetAllCartRes.fromJson(response.data);
          return getAllCartResponse;
        }
      } else {
        return GetAllCartRes(error: "Something went wrong!");
      }
    } catch (e) {
      return GetAllCartRes(error: e.toString());
    }
  }

  Future<AddCartRes?> cartQuantityDecriment(
      String id, AddCartReq addCartReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.updateDecrimentCart,
        data: addCartReq.toJson(),
        queryParameters: id,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        } else if (response.statusCode == 400) {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        } else {
          final addCartResponse = AddCartRes.fromJson(response.data);
          return addCartResponse;
        }
      } else {
        return AddCartRes(error: "Something went wrong!");
      }
    } catch (e) {
      return AddCartRes(error: e.toString());
    }
  }

  Future<DeleteCartRes?> deleteCart(String id) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.deleteSingleCart,
        queryParameters: id,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final deleteCartResponse = DeleteCartRes.fromJson(response.data);
          return deleteCartResponse;
        } else if (response.statusCode == 400) {
          final deleteCartResponse = DeleteCartRes.fromJson(response.data);
          return deleteCartResponse;
        } else {
          final deleteCartResponse = DeleteCartRes.fromJson(response.data);
          return deleteCartResponse;
        }
      } else {
        return DeleteCartRes(error: "Something went wrong!");
      }
    } catch (e) {
      return DeleteCartRes(error: e.toString());
    }
  }
}
