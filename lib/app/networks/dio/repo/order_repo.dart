import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/order_placed_req.dart';
import 'package:e_commerse/app/networks/models/res/order_placed_res.dart';

class OrderRepo {
  DioClient dioClient = DioClient(Dio());
  Future<OrderPlacedRes?> orderPlaced(OrderPlacedReq orderPlacedReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.orderPlaced,
        data: orderPlacedReq.toJson(),
      );
      if (response.data != null) {
        if (response.statusCode == 201) {
          final orderPlacedResponse = OrderPlacedRes.fromJson(response.data);
          return orderPlacedResponse;
        } else if (response.statusCode == 400) {
          final orderPlacedResponse = OrderPlacedRes.fromJson(response.data);
          return orderPlacedResponse;
        } else if (response.statusCode == 500) {
          final orderPlacedResponse = OrderPlacedRes.fromJson(response.data);
          return orderPlacedResponse;
        } else {
          return OrderPlacedRes(error: "Something went wrong");
        }
      } else {
        return OrderPlacedRes(error: "Something went wrong");
      }
    } catch (e) {
      return OrderPlacedRes(error: e.toString());
    }
  }
}
