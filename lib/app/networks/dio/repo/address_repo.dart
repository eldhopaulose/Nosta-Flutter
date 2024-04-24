import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/address_req.dart';
import 'package:e_commerse/app/networks/models/res/address_res.dart';
import 'package:e_commerse/app/networks/models/res/delete_address_res.dart';
import 'package:e_commerse/app/networks/models/res/get_address_res.dart';

class AddressRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<AddressRes?> createAddress(AddressReq addressReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.createAddress,
        data: addressReq.toJson(),
      );
      if (response.data != null) {
        if (response.statusCode == 201) {
          final addressResponse = AddressRes.fromJson(response.data);
          return addressResponse;
        } else if (response.statusCode == 400) {
          final addressResponse = AddressRes.fromJson(response.data);
          return addressResponse;
        } else {
          final addressResponse = AddressRes.fromJson(response.data);
          return addressResponse;
        }
      } else {
        return AddressRes(error: "Something went wrong");
      }
    } catch (e) {
      return AddressRes(error: e.toString());
    }
  }

  Future<GetAddressRes?> getAllAddress() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getAddress,
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          final addressResponse = GetAddressRes.fromJson(response.data);
          return addressResponse;
        } else if (response.statusCode == 400) {
          final addressResponse = GetAddressRes.fromJson(response.data);
          return addressResponse;
        } else {
          final addressResponse = GetAddressRes.fromJson(response.data);
          return addressResponse;
        }
      } else {
        return GetAddressRes(error: "Something went wrong");
      }
    } catch (e) {
      return GetAddressRes(error: e.toString());
    }
  }

  Future<DeleteAddressRes?> deleteAddress(String addressId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.deleteAddress,
        queryParameters: addressId,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        } else if (response.statusCode == 400) {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        } else {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        }
      } else {
        return DeleteAddressRes(error: "Something went wrong");
      }
    } catch (e) {
      return DeleteAddressRes(error: e.toString());
    }
  }

  Future<DeleteAddressRes?> updateAddress(
    AddressReq addressReq,
    String addressId,
  ) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.updateAddress,
        queryParameters: addressId,
        data: addressReq.toJson(),
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        } else if (response.statusCode == 400) {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        } else {
          final addressResponse = DeleteAddressRes.fromJson(response.data);
          return addressResponse;
        }
      } else {
        return DeleteAddressRes(error: "Something went wrong");
      }
    } catch (e) {
      return DeleteAddressRes(error: e.toString());
    }
  }
}
