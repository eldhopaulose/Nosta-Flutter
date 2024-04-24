import 'package:dio/dio.dart';

import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/res/get_product_res.dart';
import 'package:e_commerse/app/networks/models/res/get_single_product_by_id.dart';

class ProductRepo {
  DioClient dioClient = DioClient(Dio());
  Future<GetProductRes?> getProduct(String category) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getProductsData,
        queryParameters: category,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final getProductResponse = GetProductRes.fromJson(response.data);
          return getProductResponse;
        } else if (response.statusCode == 400) {
          final getProductResponse = GetProductRes.fromJson(response.data);
          return getProductResponse;
        } else {
          return GetProductRes(error: "Something went wrong");
        }
      } else {
        return GetProductRes(error: "Something went wrong");
      }
    } catch (e) {
      return GetProductRes(error: e.toString());
    }
  }

  Future<GetSingleProductByIdRes?> getSingleProduct(String productId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getSingleProductById,
        queryParameters: productId,
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          final getSingleProductByIdResponse =
              GetSingleProductByIdRes.fromJson(response.data);
          return getSingleProductByIdResponse;
        } else if (response.statusCode == 400) {
          final getSingleProductByIdResponse =
              GetSingleProductByIdRes.fromJson(response.data);
          return getSingleProductByIdResponse;
        } else {
          return GetSingleProductByIdRes(error: "Something went wrong");
        }
      } else {
        return GetSingleProductByIdRes(error: "Something went wrong");
      }
    } catch (e) {
      return GetSingleProductByIdRes(error: e.toString());
    }
  }
}
