import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/res/offer_res.dart';

class OfferRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<OfferRes?> getOffer() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getOffer,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final offerResponse = OfferRes.fromJson(response.data);

          return offerResponse;
        } else if (response.statusCode == 400) {
          final offerResponse = OfferRes.fromJson(response.data);

          return offerResponse;
        } else {
          final offerResponse = OfferRes.fromJson(response.data);

          return offerResponse;
        }
      } else {
        return OfferRes(error: "Something went wrong");
      }
    } catch (e) {
      return OfferRes(error: e.toString());
    }
  }
}
